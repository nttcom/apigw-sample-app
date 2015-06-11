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
class ApigwRequest

  def self.request_access_token(consumer_key, secret_key)

    connection = Faraday.new Settings.apigw.host do |c|
      c.request :json
      c.response :json
      c.adapter Faraday.default_adapter
    end

    # productionモード以外では自己証明書を突破する
    connection.ssl.verify = Rails.env.production?

    response = connection.post do |request|
      request.url Settings.apigw.path
      request.body = {
        grantType: 'client_credentials',
        clientId: consumer_key,
        clientSecret: secret_key
      }
      request.options.timeout = 10
      request.options.open_timeout = 10
    end

    response.body
  end

end
