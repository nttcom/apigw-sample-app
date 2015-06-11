'use strict'

describe 'Controller: ContractGroupCtrl', ->

  # load the controller's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  ContractGroupCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ContractGroupCtrl = $controller 'ContractGroupCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
