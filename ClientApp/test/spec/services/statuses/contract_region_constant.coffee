'use strict'

describe 'Service: statuses/contractRegionConstant', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  contractRegionConstant = {}
  beforeEach inject (_contractRegionConstant_) ->
    contractRegionConstant = _contractRegionConstant_

  it 'should do something', ->
    expect(!!contractRegionConstant).toBe true
