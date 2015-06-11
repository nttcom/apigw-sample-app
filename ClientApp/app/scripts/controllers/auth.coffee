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
 # @ngdoc function
 # @name nttcomApiGatewayWebappApp.controller:AuthCtrl
 # @description
 # # AuthCtrl
 # Controller of the nttcomApiGatewayWebappApp
###
angular.module 'nttcomApiGatewayWebappApp'
  .controller 'AuthCtrl',
  [ '$scope', '$routeParams', '$location', class AuthCtrl
    constructor: (@$scope, @$routeParams, @$location) ->
      accessToken = @$routeParams.token
      issuedAt = @$routeParams.issued
      expiresIn = @$routeParams.expires

      if accessToken? and issuedAt? and expiresIn?
        if angular.isString accessToken
          storage = @$scope.$parent.$storage
          storage.accessToken = accessToken
          storage.issuedAt = issuedAt
          storage.expiresIn = expiresIn

      @$location.path('/').search('')
  ]