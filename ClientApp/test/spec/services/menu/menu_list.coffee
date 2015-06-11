'use strict'

describe 'Service: menuList', ->

  # load the service's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  # instantiate service
  menuList = {}
  beforeEach inject (_menuList_) ->
    menuList = _menuList_

  it 'should do something', ->
    expect(!!menuList).toBe true
