'use strict'

describe 'Service: contractStore', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  contractStore = {}
  beforeEach inject (_contractStore_) ->
    contractStore = _contractStore_

  it 'should do something', ->
    expect(!!contractStore).toBe true
