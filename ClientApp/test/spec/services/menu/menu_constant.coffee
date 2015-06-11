'use strict'

describe 'Service: menuConstant', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  menuConstant = {}
  beforeEach inject (_menuConstant_) ->
    menuConstant = _menuConstant_

  it 'should do something', ->
    expect(!!menuConstant).toBe true
