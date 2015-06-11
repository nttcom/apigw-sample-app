'use strict'

describe 'Filter: serviceSortOrder', ->

  # load the filter's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # initialize a new instance of the filter before each test
  serviceSortOrder = {}
  beforeEach inject ($filter) ->
    serviceSortOrder = $filter 'serviceSortOrder'

  it 'should return the input prefixed with "serviceSortOrder filter:"', ->
    text = 'angularjs'
    expect(serviceSortOrder text).toBe ('serviceSortOrder filter: ' + text)
