'use strict'

describe 'Service: serviceOrderStore', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  serviceOrderStore = {}
  beforeEach inject (_serviceOrderStore_) ->
    serviceOrderStore = _serviceOrderStore_

  it 'should do something', ->
    expect(!!serviceOrderStore).toBe true
