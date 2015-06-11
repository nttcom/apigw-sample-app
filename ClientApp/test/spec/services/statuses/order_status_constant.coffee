'use strict'

describe 'Service: orderStatusConstant', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  orderStatusConstant = {}
  beforeEach inject (_orderStatusConstant_) ->
    orderStatusConstant = _orderStatusConstant_

  it 'should do something', ->
    expect(!!orderStatusConstant).toBe true
