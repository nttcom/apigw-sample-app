'use strict'

describe 'Directive: ncsType', ->

  # load the directive's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<ncs-type></ncs-type>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the ncsType directive'
