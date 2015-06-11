'use strict'

describe 'Service: troubleStatusConstant', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  troubleStatusConstant = {}
  beforeEach inject (_troubleStatusConstant_) ->
    troubleStatusConstant = _troubleStatusConstant_

  it 'should do something', ->
    expect(!!troubleStatusConstant).toBe true
