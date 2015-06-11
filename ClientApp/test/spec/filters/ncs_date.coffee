'use strict'

describe 'Filter: ncsDate', ->

  # load the filter's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # initialize a new instance of the filter before each test
  ncsDate = {}
  beforeEach inject ($filter) ->
    ncsDate = $filter 'ncsDate'

  it 'should return the input prefixed with "ncsDate filter:"', ->
    text = 'angularjs'
    expect(ncsDate text).toBe ('ncsDate filter: ' + text)
