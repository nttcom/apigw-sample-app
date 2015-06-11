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
 # @name nttcomApiGatewayWebappApp.statuses/orderTypeConstant
 # @description
 # # statuses/orderTypeConstant
 # Constant in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .constant 'orderTypeConstant',

    "uno":
      data: [
        # 国内UNO
        { value: "1", label: "新規" }
        { value: "2", label: "変更" }
        { value: "3", label: "廃止" }

        # 国際UNO
        { value: "2-1", label: "新規" }
        { value: "2-2", label: "新規(切り替え)" }
        { value: "2-3", label: "廃止" }
        { value: "2-4", label: "廃止(切り替え)" }
        { value: "2-5", label: "帯域増速" }
        { value: "2-6", label: "帯域減速" }
        { value: "2-7", label: "移設" }
        { value: "2-8", label: "変更" }
        { value: "2-9", label: "設定変更(PE/CE)" }
        { value: "2-10", label: "設定変更(PE)" }
        { value: "2-11", label: "設定変更(CE)" }
      ]

    # BDP-E, MSS
    "bdp-e":
      data: [
        { value: "1", label: "新規" }
        { value: "2", label: "変更" }
        { value: "3", label: "廃止" }
      ]

    # SIP Trunking, UCaaS
    "ucaas":
     data: [
        { value: "1", label: "新規" }
        { value: ["2", "4"], label: "変更" }
        { value: "3", label: "廃止" }
      ]

    # 050plusbiz, ip-voice, smart-pbx, accs
    "voice":
      data: [
        { value: "S1K", label: "新設" }
        { value: "N1K", label: "請求情報変更" }
        { value: "N2K", label: "利用開始日変更" }
        { value: "N4K", label: "料金割引変更" }
        { value: ["N6K", "N9K", "NGK"], label: "簡易変更" }
        { value: ["T1K", "T2K", "T7K", "T8K"], label: "移転／品目変更" }
        { value: "T4K", label: "商品変更" }
        { value: "T5K", label: "サービス情報変更" }
        { value: "G1K", label: "契約グループ番号変更" }
        { value: "H1K", label: "廃止" }
      ]
