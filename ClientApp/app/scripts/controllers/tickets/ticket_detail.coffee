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
 # @name nttcomApiGatewayWebappApp.controller:TicketDetailCtrl
 # @description
 # # TicketDetailCtrl
 # Controller of the nttcomApiGatewayWebappApp
###
angular.module 'nttcomApiGatewayWebappApp'
  .controller 'TicketDetailCtrl',
  [ '$scope', '$routeParams', '$location', '$anchorScroll', 'ticketStore', 'serviceFactory',
  class TicketDetailCtrl

    constructor: (@$scope, @$routeParams, @$location, @$anchorScroll, @ticketStore, @serviceFactory) ->
      @$scope.$on 'serviceSelected', this.onServiceSelected
      @$scope.$emit 'menuChanged', 'tickets'
      @$anchorScroll()

      @service = @serviceFactory[@$routeParams.serviceKey]
      @ticketId = @$routeParams.id

      @loading = true
      @ticketStore.get @service, this.onGetSucceeded, this.onGetFailed

    onGetSucceeded: (items) =>
      for item in items
        if @ticketId == item.troubleTicketId
          @ticket = item
          break
      @loading = false

    onGetFailed: (status, message) =>
      @message = message
      @loading = false

    onServiceSelected: (event, serviceKey) =>
      @$location.path("/tickets/#{serviceKey}").search('')
  ]
