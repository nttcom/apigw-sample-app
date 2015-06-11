'use strict'

describe 'Service: apiSettings', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  apiSettings = {}
  beforeEach inject (_apiSettings_) ->
    apiSettings = _apiSettings_

  it 'should do something', ->
    expect(!!apiSettings).toBe true
