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
 # @name nttcomApiGatewayWebappApp.serviceConstant
 # @description
 # # serviceConstant
 # Constant in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .constant 'serviceConstant',

    uno:
      name: "UNO"
      requestKey: "uno"
      showVpnGroupId: true
      excludes: [
        "Arcstar Universal One モバイル"
        "Arcstar Universal One モバイル グローバルM2M"
        "Global M2M"
        "Arcstar Universal One Virtual"
      ]
      orderTypeKey: "uno"
      orderStatusKey: "uno"
      troubleStatusKey: "uno"
    "uno-mobile":
      name: "UNOモバイル"
      requestKey: "uno"
      showVpnGroupId: true
      includes: [
        "Arcstar Universal One モバイル"
      ]
      orderTypeKey: "uno"
      orderStatusKey: "uno"
      troubleStatusKey: "uno"
    "global-m2m":
      name: "GlobalM2M"
      requestKey: "uno"
      showVpnGroupId: true
      includes: [
        "Arcstar Universal One モバイル グローバルM2M"
        "Global M2M"
      ]
      orderTypeKey: "uno"
      orderStatusKey: "uno"
      troubleStatusKey: "uno"
    "uno-virtual":
      name: "UNO Virtual"
      requestKey: "uno"
      showVpnGroupId: true
      includes: [
        "Arcstar Universal One Virtual"
      ]
      orderTypeKey: "uno"
      orderStatusKey: "uno"
      troubleStatusKey: "uno"
    cloudn:
      name: "Cloudn"
      requestKey: "cloudn"
    bhec:
      name: "BHEC"
      requestKey: "bhec"
      showCRef: true
      troubleStatusKey: "bhec"
    ucaas:
      name: "UCaaS"
      requestKey: "ucaas"
      orderTypeKey: "ucaas"
      orderStatusKey: "ucaas"
      troubleStatusKey: "ucaas"
    "sip-trunking":
      name: "SIP Trunking"
      requestKey: "sip-trunking"
      orderTypeKey: "ucaas"
      orderStatusKey: "ucaas"
      troubleStatusKey: "ucaas"
    "050plusbiz":
      name: "050 plus for Biz"
      requestKey: "050plusbiz"
      orderTypeKey: "voice"
      orderStatusKey: "voice"
      troubleStatusKey: "voice"
    "ip-voice":
      name: "IP Voice"
      requestKey: "ip-voice"
      orderTypeKey: "voice"
      orderStatusKey: "voice"
      troubleStatusKey: "voice"
    "smart-pbx":
      name: "Smart PBX"
      requestKey: "smart-pbx"
      orderTypeKey: "voice"
      orderStatusKey: "voice"
      troubleStatusKey: "voice"
    accs:
      name: "Contact Center"
      requestKey: "accs"
      orderTypeKey: "voice"
      orderStatusKey: "voice"
      troubleStatusKey: "voice"
    bizmail:
      name: "Bizメール"
      requestKey: "bizmail"
    "bdp-e":
      name: "Bizデスクトップ"
      requestKey: "bdp-e"
      orderTypeKey: "bdp-e"
      orderStatusKey: "bdp-e"
      troubleStatusKey: "bdp-e"
    mss:
      name: "WideAngle"
      requestKey: "mss"
      orderTypeKey: "bdp-e"
      orderStatusKey: "mss"
      troubleStatusKey: "bdp-e"
    gmone:
      name: "GMOne"
      requestKey: "gmone"
