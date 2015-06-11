'use strict'

describe 'Filter: pagination', ->

  # load the filter's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # initialize a new instance of the filter before each test
  pagination = {}
  beforeEach inject ($filter) ->
    pagination = $filter 'pagination'

  it 'should return the input prefixed with "pagination filter:"', ->
    text = 'angularjs'
    expect(pagination text).toBe ('pagination filter: ' + text)
