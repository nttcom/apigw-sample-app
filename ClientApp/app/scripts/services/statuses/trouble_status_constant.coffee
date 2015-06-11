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
 # @name nttcomApiGatewayWebappApp.statuses/troubleStatusConstant
 # @description
 # # statuses/troubleStatusConstant
 # Constant in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .constant 'troubleStatusConstant',

    # UNO
    "uno":
      data: [
        { value: "1",                   label: "承認待ち" }
        { value: "2",                   label: "オープン" }
        { value: "3",                   label: "クローズ待ち" }
        { value: "4",                   label: "クローズ" }
        { value: "5",                   label: "破棄" }
        { value: ["100", "101"],        label: "対応開始" }
        { value: ["102", "103"],        label: "原因分析中" }
        { value: ["104", "105", "106"], label: "復旧作業中" }
        { value: ["107", "108"],        label: "復旧済" }
        { value: "109",                 label: "対応開始" }
        { value: "200",                 label: "保留中" }
        { value: "300",                 label: "復旧済" }
        { value: ["301", "400"],        label: "対応終了" }
      ]

    # BDP-E, MSS
    "bdp-e":
      data: [
        { value: "1", label: "オープン" }
        { value: "2", label: "クローズ" }
      ]

    # SIP Trunking, UCasS
    "ucaas":
      data: [
        { value: ["100", "101"],        label: "対応開始" }
        { value: ["102", "103"],        label: "原因分析中" }
        { value: ["104", "105", "106"], label: "復旧作業中" }
        { value: ["107", "108"],        label: "復旧済" }
        { value: "109",                 label: "対応開始" }
        { value: "200",                 label: "保留中" }
        { value: "300",                 label: "復旧済" }
        { value: ["301", "400"],        label: "対応終了" }
      ]

    # BHEC
    "bhec":
      data: [
        { value: "2", label: "オープン" }
        { value: "3", label: "クローズ待ち" }
        { value: "4", label: "クローズ" }
      ]

    # 050plusbiz, ip-voice, smart-pbx, accs
    "voice":
      data: [
        { value: "1",                   label: "承認待ち" }
        { value: "2",                   label: "オープン" }
        { value: "3",                   label: "クローズ待ち" }
        { value: "4",                   label: "クローズ" }
        { value: "5",                   label: "破棄" }
        { value: ["100", "101"],        label: "対応開始" }
        { value: ["102", "103"],        label: "原因分析中" }
        { value: ["104", "105", "106"], label: "復旧作業中" }
        { value: ["107", "108"],        label: "復旧済み" }
        { value: "109",                 label: "対応開始" }
        { value: "200",                 label: "保留中" }
        { value: "300",                 label: "復旧済み" }
        { value: ["301", "400"],        label: "対応終了" }
      ]
