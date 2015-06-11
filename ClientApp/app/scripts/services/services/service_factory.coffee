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
 # @name nttcomApiGatewayWebappApp.serviceFactory
 # @description
 # # serviceFactory
 # Factory in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .factory 'serviceFactory',
  (serviceConstant, serviceStatusConstant, orderTypeConstant, orderStatusConstant, troubleStatusConstant, contractRegionConstant) ->
    # プライベートメソッド

    # valueが3つ以上の連続した数値(形式の文字列)であれば 100-102 のようにまとめる
    # そうでなければそのまま返却する
    mergeValue = (value) ->
      if Array.isArray(value)
        len = value.length
        if len > 2
          last = len - 1
          for i in [0..last]
            continue if i is 0
            currentValue = value[i]
            prevValue = value[i-1]
            currentInt = parseInt(currentValue)
            prevInt = parseInt(prevValue)
            if currentInt? is prevInt?
              if currentInt is prevInt + 1
                if i is last
                  return "#{value[0]}-#{value[last]}"
                  return "isSequential!"
                else
                  continue
            break

      if value is ''
        value = '(空)'

      return value

    # ステータスorタイプのハッシュ、絞り込み選択肢、ソート順を詰めたハッシュを作成
    createHashByKeyOrDefault = (constant, key) ->
      # ステータス絞り込み「すべて」は必ず先頭にある
      ret = { options: [ {label: 'すべて', value: 0} ] }

      # keyが無い場合デフォルト値を取る
      key = "__DEFAULT__" unless key?
      statusRaw = constant[key]
      if statusRaw?
        ret.data = statusRaw.data

        # ステータス絞り込み選択肢の作成
        for status in ret.data
          option = {
            label: "#{mergeValue status.value}: #{status.label}"
            value: status.value
          }
          if status.contractRegion?
            contractRegion = status.contractRegion
            option['contractRegion'] = contractRegion
            option['label'] = "#{contractRegionConstant[contractRegion]}: #{option.label}"
          ret.options.push option

        # 一覧でのステータスによるソート順を作成
        sortOrder = []
        if statusRaw.sortOrder?
          # sortOrderが定義されている場合はそれを使用
          sortOrder = statusRaw.sortOrder
        else
          # 無い場合はdataの並び順と同じ
          for status in ret.data
            value = status.value
            value = [value] unless angular.isArray value
            sortOrder = sortOrder.concat status.value
        ret.sortOrder = sortOrder

      return ret

    # デフォルト値しかないので先に作成
    serviceStatusHash = createHashByKeyOrDefault serviceStatusConstant
    serviceStatuses = serviceStatusHash.data
    serviceStatusOptions = serviceStatusHash.options
    serviceStatusSortOrder = serviceStatusHash.sortOrder

    # クラス
    class Service
      constructor: (@key, value) ->
        @name = value.name
        @requestKey = value.requestKey
        @includes = value.includes
        @excludes = value.excludes
        @showVpnGroupId = if value.showVpnGroupId? then value.showVpnGroupId else false
        @showCRef = if value.showCRef? then value.showCRef else false

        @serviceStatuses = serviceStatuses
        @serviceStatusOptions = serviceStatusOptions
        @serviceStatusSortOrder = serviceStatusSortOrder

        orderTypeObj = createHashByKeyOrDefault orderTypeConstant, value.orderTypeKey
        @orderTypes = orderTypeObj.data

        orderStatusObj = createHashByKeyOrDefault orderStatusConstant, value.orderStatusKey
        @orderStatuses = orderStatusObj.data
        @orderStatusOptions = orderStatusObj.options
        @orderStatusSortOrder = orderStatusObj.sortOrder

        troubleStatusObj = createHashByKeyOrDefault troubleStatusConstant, value.troubleStatusKey
        @troubleStatuses = troubleStatusObj.data
        @troubleStatusOptions = troubleStatusObj.options
        @troubleStatusSortOrder = troubleStatusObj.sortOrder

    # サービスの連想配列を作成して返却
    services = {}
    for key in Object.keys(serviceConstant)
      services[key] = new Service(key, serviceConstant[key])

    return services
