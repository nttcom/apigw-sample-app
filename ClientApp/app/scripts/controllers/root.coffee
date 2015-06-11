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
 # @name nttcomApiGatewayWebappApp.controller:RootCtrl
 # @description
 # # RootCtrl
 # Controller of the nttcomApiGatewayWebappApp
###
angular.module 'nttcomApiGatewayWebappApp'
  .controller 'RootCtrl',
  [ '$scope', '$location', '$localStorage', '$log', 'menuFactory', 'menuList', 'serviceCategoryFactory',
  class RootCtrl

    # 'Controller as'表記でも、broadcast/emit/onを使う場合は、$scopeをDIする必要あり
    constructor: (@$scope, @$location, @$localStorage, @$log, @menuFactory, @menuList, @serviceCategoryFactory) ->
      @$scope.$on 'menuChanged', this.onMenuChanged
      @$scope.$on 'serviceChanged', this.onServiceChanged

      @$scope.$storage = @$localStorage.$default({
        serviceKey: 'uno',
        accessToken: null
        issuedAt: null
        expiresIn: null
      })

    copyright: ->
      year = new Date().getFullYear()
      "Copyright &copy; #{year} NTT Communications"

    isMenuSelected: (menuKey) ->
      @menu?.key is menuKey

    isServiceSelected: (serviceKey) ->
      @serviceKey is serviceKey

    isServiceDisabled: (serviceKey) ->
      @menu?.isServiceDisabled serviceKey

    # 子controllerで $scope.$emit 'menuChanged' 時
    onMenuChanged: (event, menuKey) =>
      @menu = @menuFactory[menuKey]

    # 子controllerで $scope.$emit 'serviceChanged' 時
    onServiceChanged: (event, serviceKey) =>
      @serviceKey = serviceKey
      @$scope.$storage.serviceKey = serviceKey

    # 左メニュークリック時
    menuClick: (menuKey) ->
      @$location.path("/#{menuKey}/#{@$scope.$storage.serviceKey}").search('')
      angular.element('#menu').offcanvas('hide')
      return

    # 右メニュークリック時
    serviceClick: (serviceKey) ->
      return if this.isServiceDisabled(serviceKey)
      @$scope.$broadcast 'serviceSelected', serviceKey
      angular.element('#services').offcanvas('hide')
      return
  ]
