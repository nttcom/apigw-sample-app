'use strict'

describe 'Filter: truncate', ->

  # load the filter's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # initialize a new instance of the filter before each test
  truncate = {}
  beforeEach inject ($filter) ->
    truncate = $filter 'truncate'

  it 'should return the input prefixed with "truncate filter:"', ->
    text = 'angularjs'
    expect(truncate text).toBe ('truncate filter: ' + text)
