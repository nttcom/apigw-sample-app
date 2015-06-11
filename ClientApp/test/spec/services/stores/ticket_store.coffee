'use strict'

describe 'Service: ticketStore', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  ticketStore = {}
  beforeEach inject (_ticketStore_) ->
    ticketStore = _ticketStore_

  it 'should do something', ->
    expect(!!ticketStore).toBe true
