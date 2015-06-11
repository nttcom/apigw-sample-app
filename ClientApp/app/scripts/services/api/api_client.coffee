### 
 Copyright 2015 NTT Communications Corportation, https://developer.ntt.com/

 Licensed to the Apache Software Foundation (ASF) under one or more
 contributor license agreements.  See the NOTICE file distributed with
 this work for additional information regarding copyright ownership.
 The ASF licenses this file to You under the Apache License, Version 2.0
 (the "License"); you may not use this file except in compliance with
 the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
### 
'use strict'

###*
 # @ngdoc service
 # @name nttcomApiGatewayWebappApp.apiClient
 # @description
 # # apiClient
 # Service in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .service 'apiClient',
  [ '$http', '$log', 'apiSettings', 'accessTokenDecrypter'
  ($http, $log, apiSettings, accessTokenDecrypter) ->
    # プライベート
    redirectToLogin = ->
      window.location = apiSettings.auth_url
      return

    getRequest = (url, serviceName, success, failure) ->
      # アクセストークンがあり、かつ有効期限内であるか確認
      # そうでなければログイン画面に戻す
      accessToken = accessTokenDecrypter.getAccessToken()
      return redirectToLogin() unless accessToken?

      headers = { 'Authorization': "Bearer #{accessToken}" }
      $http({
        method: 'GET',
        url: url,
        headers: headers,
        params: {
          'serviceName' : serviceName
        },
        timeout: apiSettings.timeout_ms
      })
      .success (data, status, headers, config) ->
        success data.items
      .error (data, status, headers, config) ->
        $log.log "API FAILED: #{status}"

        switch status
          when 401
            # 401の場合はログイン画面にリダイレクト
            return redirectToLogin()
          when 0
            # ステータスコードが無い = タイムアウトとして扱う
            message = 'ネットワークに接続できないか、接続がタイムアウトしました。
            ご利用のネットワーク環境をご確認頂くか、しばらく時間をおいてからお試し下さい。'
          else
            # 401以外のステータスコード = サーバー側エラー
            message = 'サーバに接続できませんでした。しばらく時間をおいてからお試し下さい。'

        failure status, message if failure?

    # パブリック
    {
      getContracts: (serviceName, success, failure) ->
        getRequest apiSettings.url.contracts, serviceName, success, failure

      getServiceOrders: (serviceName, success, failure) ->
        getRequest apiSettings.url.serviceOrders, serviceName, success, failure

      getTickets: (serviceName, success, failure) ->
        getRequest apiSettings.url.tickets, serviceName, success, failure
    }
  ]
