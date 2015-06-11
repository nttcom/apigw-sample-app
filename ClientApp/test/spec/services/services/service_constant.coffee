'use strict'

describe 'Service: serviceConstant', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  serviceConstant = {}
  beforeEach inject (_serviceConstant_) ->
    serviceConstant = _serviceConstant_

  it 'should do something', ->
    expect(!!serviceConstant).toBe true
