'use strict'

describe 'Service: serviceStatusConstant', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  serviceStatusConstant = {}
  beforeEach inject (_serviceStatusConstant_) ->
    serviceStatusConstant = _serviceStatusConstant_

  it 'should do something', ->
    expect(!!serviceStatusConstant).toBe true
