'use strict'

describe 'Controller: ContractListCtrl', ->

  # load the controller's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  ContractListCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ContractListCtrl = $controller 'ContractListCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
