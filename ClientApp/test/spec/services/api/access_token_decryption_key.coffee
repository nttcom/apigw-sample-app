'use strict'

describe 'Service: accessTokenDecryptionKey', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  accessTokenDecryptionKey = {}
  beforeEach inject (_accessTokenDecryptionKey_) ->
    accessTokenDecryptionKey = _accessTokenDecryptionKey_

  it 'should do something', ->
    expect(!!accessTokenDecryptionKey).toBe true
