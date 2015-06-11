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
 # @name nttcomApiGatewayWebappApp.statuses/orderStatusConstant
 # @description
 # # statuses/orderStatusConstant
 # Constant in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .constant 'orderStatusConstant',

    # UNO
    "uno":
      data: [
        # 国内UNO
        { value: "1", label: "受付済", contractRegion: "N" }
        { value: "2", label: "現地調査完了", contractRegion: "N" }
        { value: "3", label: "アクセス回線工事完了", contractRegion: "N" }
        { value: "4", label: "端末工事完了", contractRegion: "N" }
        { value: "5", label: "完了", contractRegion: "N" }

        # 国際UNO
        { value: "14-GO", label: "進行中", contractRegion: "W" }
        { value: "", label: "完了", contractRegion: "W" }
      ]
      sortOrder: ["1", "14-GO", "2", "3", "4", "5", ""]

    # BDP-E
    "bdp-e":
      data: [
        { value: "1", label: "進行中" }
        { value: "2", label: "完了" }
      ]

    # MSS
    "mss":
      data: [
        { value: "1", label: "進行中" }
        { value: "",  label: "完了" }
      ]

    # SIP Trunking, UCaaS
    "ucaas":
      data: [
        { value: "1", label: "進行中" }
      ]

    # 050plusbiz, ip-voice, smart-pbx, accs
    "voice":
      data: [
        { value: "0", label: "対応中" }
        { value: "-", label: "完了"}
      ]
