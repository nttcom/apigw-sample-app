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
 # @ngdoc filter
 # @name nttcomApiGatewayWebappApp.filter:status
 # @function
 # @description
 # # status
 # Filter in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .filter 'status', (filterFilter) ->
    (input, targetProperty, status) ->
      # input = 契約／オーダ／トラチケの配列
      # targetProperty = 絞り込みに使うプロパティの名前
      # status = statusモデル

      # 「すべて」の場合は何もフィルターしない
      return input if status.value is 0

      value = status.value
      # 配列でなければ配列化する
      value = [value] unless angular.isArray value

      filterFilter input, (item, index) ->
        # inputの全要素に対して、value配列に[targetProperty]プロパティの要素が入っているか判定
        targetValue = item[targetProperty]
        return false unless targetValue?

        idx = value.indexOf targetValue.toString()
        return false unless idx > -1

        # contractIdの頭の文字が、contractRegionと同じか判定
        if status.contractRegion?
          return (item.contractId.substring(0, 1) is status.contractRegion)
        else
          return true
