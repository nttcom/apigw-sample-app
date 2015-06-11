'use strict'

describe 'Service: serviceCategoryFactory', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  serviceCategoryFactory = {}
  beforeEach inject (_serviceCategoryFactory_) ->
    serviceCategoryFactory = _serviceCategoryFactory_

  it 'should do something', ->
    expect(!!serviceCategoryFactory).toBe true
