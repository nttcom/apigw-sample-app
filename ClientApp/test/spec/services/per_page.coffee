'use strict'

describe 'Service: perPage', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  perPage = {}
  beforeEach inject (_perPage_) ->
    perPage = _perPage_

  it 'should do something', ->
    expect(!!perPage).toBe true
