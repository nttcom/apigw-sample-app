'use strict'

describe 'Controller: ServiceOrderDetailCtrl', ->

  # load the controller's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  ServiceOrderDetailCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ServiceOrderDetailCtrl = $controller 'ServiceOrderDetailCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
