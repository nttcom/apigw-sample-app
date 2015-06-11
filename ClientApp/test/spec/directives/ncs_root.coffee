'use strict'

describe 'Directive: ncsRoot', ->

  # load the directive's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<ncs-root></ncs-root>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the ncsRoot directive'
