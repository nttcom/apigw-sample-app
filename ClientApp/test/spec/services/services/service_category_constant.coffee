'use strict'

describe 'Service: serviceCategoryConstant', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  serviceCategoryConstant = {}
  beforeEach inject (_serviceCategoryConstant_) ->
    serviceCategoryConstant = _serviceCategoryConstant_

  it 'should do something', ->
    expect(!!serviceCategoryConstant).toBe true
