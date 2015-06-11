'use strict'

describe 'Service: serviceFactory', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  serviceFactory = {}
  beforeEach inject (_serviceFactory_) ->
    serviceFactory = _serviceFactory_

  it 'should do something', ->
    expect(!!serviceFactory).toBe true
