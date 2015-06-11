'use strict'

describe 'Service: orderTypeConstant', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  orderTypeConstant = {}
  beforeEach inject (_orderTypeConstant_) ->
    orderTypeConstant = _orderTypeConstant_

  it 'should do something', ->
    expect(!!orderTypeConstant).toBe true
