'use strict'

describe 'Filter: service', ->

  # load the filter's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # initialize a new instance of the filter before each test
  service = {}
  beforeEach inject ($filter) ->
    service = $filter 'service'

  it 'should return the input prefixed with "service filter:"', ->
    text = 'angularjs'
    expect(service text).toBe ('service filter: ' + text)
