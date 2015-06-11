'use strict'

describe 'Controller: ContractDetailCtrl', ->

  # load the controller's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  ContractDetailCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ContractDetailCtrl = $controller 'ContractDetailCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
