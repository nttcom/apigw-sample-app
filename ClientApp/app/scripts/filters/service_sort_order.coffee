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
 # @name nttcomApiGatewayWebappApp.filter:serviceSortOrder
 # @function
 # @description
 # # serviceSortOrder
 # Filter in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .filter 'serviceSortOrder', (filterFilter, orderByFilter) ->
    (input, statusSortOrder, statusKey, secondSortKey = 'contractId') ->
      output = []

      for status in statusSortOrder
        match = filterFilter input, (item, index) ->
          targetValue = item[statusKey]
          return false unless targetValue?
          return status is targetValue.toString()

        output = output.concat orderByFilter(match, secondSortKey)

      # statusSortOrderに入っていないものを最後に詰める
      notMatch = filterFilter input, (item, index) ->
        targetValue = item[statusKey]
        return true unless targetValue?
        idx = statusSortOrder.indexOf targetValue.toString()
        return idx < 0

      output = output.concat orderByFilter(notMatch, secondSortKey)
      return output
