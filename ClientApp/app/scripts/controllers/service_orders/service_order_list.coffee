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
 # @name nttcomApiGatewayWebappApp.controller:ServiceOrderListCtrl
 # @description
 # # ServiceOrderListCtrl
 # Controller of the nttcomApiGatewayWebappApp
###
angular.module 'nttcomApiGatewayWebappApp'
  .controller 'ServiceOrderListCtrl',
  [ '$scope', '$routeParams', '$location', '$anchorScroll', 'serviceOrderStore', 'menuFactory', 'serviceFactory',
  class ServiceOrderListCtrl

    MENU_KEY: 'service_orders'

    constructor: (@$scope, @$routeParams, @$location, @$anchorScroll, @serviceOrderStore, @menuFactory, @serviceFactory) ->
      @$scope.$on 'serviceSelected', this.onServiceSelected
      @$scope.$emit 'menuChanged', this.MENU_KEY
      @$anchorScroll()

      serviceKey = @$routeParams.serviceKey
      unless serviceKey?
        @$location.path("/#{this.MENU_KEY}/#{@$scope.$storage.serviceKey}").search('')
        return

      @$scope.$emit 'serviceChanged', serviceKey
      @service = @serviceFactory[serviceKey]

      unless @menuFactory[this.MENU_KEY].isServiceDisabled serviceKey
        @loading = true
        @serviceOrderStore.request @service, this.onRequestSucceeded, this.onRequestFailed

    onServiceSelected: (event, serviceKey) =>
      @$location.path("/#{this.MENU_KEY}/#{serviceKey}").search('')

    onRequestSucceeded: (items) =>
      @serviceOrders = items
      @loading = false

    onRequestFailed: (status, message) =>
      @message = message
      @loading = false

    pageChanged: ->
      @$anchorScroll()
  ]
