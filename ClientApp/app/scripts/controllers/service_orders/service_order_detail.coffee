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
 # @name nttcomApiGatewayWebappApp.controller:ServiceOrderDetailCtrl
 # @description
 # # ServiceOrderDetailCtrl
 # Controller of the nttcomApiGatewayWebappApp
###
angular.module 'nttcomApiGatewayWebappApp'
  .controller 'ServiceOrderDetailCtrl',
  [ '$scope', '$routeParams', '$location', '$anchorScroll', 'serviceOrderStore', 'serviceFactory',
  class ServiceOrderDetailCtrl

    constructor: (@$scope, @$routeParams, @$location, @$anchorScroll, @serviceOrderStore, @serviceFactory) ->
      @$scope.$on 'serviceSelected', this.onServiceSelected
      @$scope.$emit 'menuChanged', 'service_orders'
      @$anchorScroll()

      @service = @serviceFactory[@$routeParams.serviceKey]
      @orderRequestNum = @$routeParams.id

      @loading = true
      @serviceOrderStore.get @service, this.onGetSucceeded, this.onGetFailed

    onGetSucceeded: (items) =>
      for item in items
        if @orderRequestNum is item.orderRequestNum.toString()
          @serviceOrder = item
          break
      @loading = false

    onGetFailed: (status, message) =>
      @message = message
      @loading = false

    onServiceSelected: (event, serviceKey) =>
      @$location.path("/service_orders/#{serviceKey}").search('')
  ]
