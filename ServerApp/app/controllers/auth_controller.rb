# Copyright 2015 NTT Communications Corportation, https://developer.ntt.com/
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
class AuthController < ApplicationController

  def passthru
    render status: 404, text: "Not found. Authentication passthru."
  end

  def callback
    apigw_key = nil
    accessToken = nil

    auth = request.env['omniauth.auth']
    provider = auth[:provider]

    Settings.apigw_keys.each do |key|
      match = false
      case provider
      when 'twitter'
        user_name = auth[:info][:nickname]
        match = true if key[:twitter_user_names].include? user_name
      when 'facebook'
        mail_address = auth[:info][:email]
        match = true if key[:facebook_user_mail_addresses].include? mail_address
      end
      if match
        apigw_key = key
        break
      end
    end

    # マッチするものが無ければデフォルトをセットor何もセットしない
    apigw_key ||= Settings.apigw_keys_default

    if apigw_key
      response = ApigwRequest.request_access_token apigw_key[:consumer_key], apigw_key[:secret_key]
      access_token = response['accessToken']
      issued_at = response['issuedAt']
      expires_in = response['expiresIn']
    end

    if access_token == nil || access_token.empty? || issued_at == nil || expires_in == nil
      redirect_to login_path, flash: { error: 'APIゲートウェイの認証に失敗しました。' }
      return
    end

    # 暗号化に使うIV (Initialization Vector) を生成
    iv_byte = SecureRandom.random_bytes 16
    # アクセストークンをAES256暗号化
    e_token_byte = Encrypter.encrypt access_token, iv_byte

    # IVと暗号化済アクセストークンをBase64にエンコードし、コロンで連結
    iv_b64 = Base64.strict_encode64 iv_byte
    e_token_b64 = Base64.strict_encode64 e_token_byte
    param = "#{iv_b64}:#{e_token_b64}"

    # WebAppのauthコントローラにリダイレクト
    url = ["#{Settings.webapp.url}#{Settings.webapp.path}",
      "?token=#{CGI.escape param}",
      "&issued=#{issued_at}",
      "&expires=#{expires_in}"].join
    redirect_to url
  end

  def sns_failure
    redirect_to login_path, flash: { error: '外部サービスの認証に失敗しました。' }
  end

end
