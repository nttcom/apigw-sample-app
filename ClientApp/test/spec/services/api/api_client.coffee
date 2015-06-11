'use strict'

describe 'Service: apiClient', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  apiClient = {}
  beforeEach inject (_apiClient_) ->
    apiClient = _apiClient_

  it 'should do something', ->
    expect(!!apiClient).toBe true
