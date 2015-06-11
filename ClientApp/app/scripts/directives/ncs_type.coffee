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
 # @name nttcomApiGatewayWebappApp.directive:ncsType
 # @description
 # # ncsType
###
angular.module 'nttcomApiGatewayWebappApp'
  .directive 'ncsType', (filterFilter) ->
    restrict: 'E'
    replace: true
    templateUrl: 'views/ncs_type.html'
    scope:
      types: '=' # 定義されたstatuses, types
      value: '=' # データの値

    link: (scope, element, attrs) ->
      valueChanged = ->
        iconVisible = false
        isNormal = false
        isError = false
        isWarning = false
        isMuted = false

        if scope.types? and scope.value?

          # filterを使ってtypesからvalueに一致するものを抜き出す
          match = filterFilter scope.types, (type, index) ->
            # type.valueは配列の場合がある
            values = type.value
            values = [values] unless Array.isArray values
            idx = values.indexOf scope.value.toString()
            idx > -1

          if match.length is 1
            type = match[0]
            scope.label = type.label
            if type.icon?
              iconVisible = true
              switch type.icon
                when 'normal'
                  isNormal = true
                when 'error'
                  isError = true
                when 'warning'
                  isWarning = true
                when 'muted'
                  isMuted = true

          else
            scope.label = '不明'
        else
          scope.label = ''

        scope.iconVisible = iconVisible
        scope.isNormal = isNormal
        scope.isError = isError
        scope.isWarning = isWarning
        scope.isMuted = isMuted

      scope.$watch 'types', valueChanged
      scope.$watch 'value', valueChanged

