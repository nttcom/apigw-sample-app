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
 # @name nttcomApiGatewayWebappApp.serviceCategoryFactory
 # @description
 # # serviceCategoryFactory
 # Factory in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .factory 'serviceCategoryFactory',
  [ 'serviceCategoryConstant', 'serviceFactory', (serviceCategoryConstant, serviceFactory) ->
    # クラス
    class ServiceCategory
      constructor: (@key, value) ->
        @name = value.name

        @services = []
        for serviceKey in value.serviceKeys
          @services.push serviceFactory[serviceKey]

    # サービスカテゴリーの連想配列を作成して返却
    serviceCategories = {}
    for key in Object.keys(serviceCategoryConstant)
      serviceCategories[key] = new ServiceCategory(key, serviceCategoryConstant[key])

    return serviceCategories
  ]
