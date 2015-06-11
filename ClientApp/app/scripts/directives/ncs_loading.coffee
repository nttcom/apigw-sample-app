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
 # @ngdoc directive
 # @name nttcomApiGatewayWebappApp.directive:ncsLoading
 # @description
 # # ncsLoading
###
angular.module 'nttcomApiGatewayWebappApp'
  .directive 'ncsLoading', ->
    restrict: 'E'
    replace: true
    transclude: true
    templateUrl: 'views/ncs_loading.html'

    scope:
      available: '='
      loading: '='
      message: '='

    link: (scope, element, attrs) ->
      toggleView = ->
        if scope.message?
          scope.alertVisible = true
          scope.indicatorVisible = false
          return
        else
          scope.alertVisible = false

        if scope.loading? and scope.loading is true
          scope.indicatorVisible = true
        else
          scope.indicatorVisible = false
          if scope.available? and scope.available != 0
            scope.noDataVisible = false
          else
            scope.noDataVisible = true

      scope.$watch 'available', toggleView
      scope.$watch 'loading', toggleView
      scope.$watch 'message', toggleView
