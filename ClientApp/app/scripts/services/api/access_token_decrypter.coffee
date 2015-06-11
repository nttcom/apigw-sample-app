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
 # @name nttcomApiGatewayWebappApp.api/accessTokenDecrypter
 # @description
 # # api/accessTokenDecrypter
 # Service in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .service 'accessTokenDecrypter', ($localStorage, accessTokenDecryptionKey) ->
    {
      getAccessToken: ->
        data = $localStorage.accessToken
        issuedAt = $localStorage.issuedAt
        expiresIn = $localStorage.expiresIn
        if data? and issuedAt? and expiresIn?
          # expiresInはミリ秒に変換する
          expireDate = new Date(parseInt(issuedAt) + parseInt(expiresIn) * 1000)
          currentDate = new Date()
          if expireDate > currentDate
            ary = data.split(':')
            key = CryptoJS.lib.WordArray.create accessTokenDecryptionKey, accessTokenDecryptionKey.length*4
            iv = CryptoJS.enc.Base64.parse ary[0]
            encryptedToken_b64 = ary[1]
            if iv? and encryptedToken_b64?
              decrypted = CryptoJS.AES.decrypt encryptedToken_b64, key, { iv: iv, mode: CryptoJS.mode.CBC }
              return decrypted.toString(CryptoJS.enc.Utf8)

        # デバイストークン期限切れの場合等は情報を削除する
        $localStorage.accessToken = null
        $localStorage.issuedAt = null
        $localStorage.expiresIn = null
        return null
    }
