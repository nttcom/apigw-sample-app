'use strict'

describe 'Filter: status', ->

  # load the filter's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # initialize a new instance of the filter before each test
  status = {}
  beforeEach inject ($filter) ->
    status = $filter 'status'

  it 'should return the input prefixed with "status filter:"', ->
    text = 'angularjs'
    expect(status text).toBe ('status filter: ' + text)
