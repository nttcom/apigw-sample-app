'use strict'

describe 'Filter: vpnGroup', ->

  # load the filter's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # initialize a new instance of the filter before each test
  vpnGroup = {}
  beforeEach inject ($filter) ->
    vpnGroup = $filter 'vpnGroup'

  it 'should return the input prefixed with "vpnGroup filter:"', ->
    text = 'angularjs'
    expect(vpnGroup text).toBe ('vpnGroup filter: ' + text)
