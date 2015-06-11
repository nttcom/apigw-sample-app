'use strict'

describe 'Service: menuFactory', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  menuFactory = {}
  beforeEach inject (_menuFactory_) ->
    menuFactory = _menuFactory_

  it 'should do something', ->
    expect(!!menuFactory).toBe true
