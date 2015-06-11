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
 # @ngdoc overview
 # @name nttcomApiGatewayWebappApp
 # @description
 # # nttcomApiGatewayWebappApp
 #
 # Main module of the application.
###
angular
  .module 'nttcomApiGatewayWebappApp', [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ngStorage',
    'ui.bootstrap',
    'angularSpinner'
  ]
  .config ['$routeProvider', 'paginationConfig', 'perPage', ($routeProvider, paginationConfig, perPage) ->
    $routeProvider
      .when '/contracts',
        templateUrl: 'views/contracts/contract_list.html'
      .when '/contracts/:serviceKey',
        templateUrl: 'views/contracts/contract_list.html'
      .when '/contracts/:serviceKey/:id',
        templateUrl: 'views/contracts/contract_detail.html'
      .when '/contracts/:serviceKey/:id/:vpnGroupId',
        templateUrl: 'views/contracts/contract_group.html'
      .when '/service_orders',
        templateUrl: 'views/service_orders/service_order_list.html'
      .when '/service_orders/:serviceKey',
        templateUrl: 'views/service_orders/service_order_list.html'
      .when '/service_orders/:serviceKey/:id',
        templateUrl: 'views/service_orders/service_order_detail.html'
      .when '/tickets',
        templateUrl: 'views/tickets/ticket_list.html'
      .when '/tickets/:serviceKey',
        templateUrl: 'views/tickets/ticket_list.html'
      .when '/tickets/:serviceKey/:id',
        templateUrl: 'views/tickets/ticket_detail.html'
      .when '/auth',
        templateUrl: 'views/auth.html'
      .otherwise
        redirectTo: '/contracts'

    paginationConfig.itemsPerPage = perPage
    paginationConfig.previousText = '‹'
    paginationConfig.nextText = '›'
    paginationConfig.maxSize = 5
  ]
