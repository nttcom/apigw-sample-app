'use strict'

describe 'Filter: forwardMatch', ->

  # load the filter's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # initialize a new instance of the filter before each test
  forwardMatch = {}
  beforeEach inject ($filter) ->
    forwardMatch = $filter 'forwardMatch'

  it 'should return the input prefixed with "forwardMatch filter:"', ->
    text = 'angularjs'
    expect(forwardMatch text).toBe ('forwardMatch filter: ' + text)
