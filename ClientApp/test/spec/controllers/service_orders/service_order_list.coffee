'use strict'

describe 'Controller: ServiceOrderListCtrl', ->

  # load the controller's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  ServiceOrderListCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ServiceOrderListCtrl = $controller 'ServiceOrderListCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
