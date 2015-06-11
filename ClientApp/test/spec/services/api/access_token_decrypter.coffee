'use strict'

describe 'Service: accessTokenDecrypter', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  accessTokenDecrypter = {}
  beforeEach inject (_accessTokenDecrypter_) ->
    accessTokenDecrypter = _accessTokenDecrypter_

  it 'should do something', ->
    expect(!!accessTokenDecrypter).toBe true
