'use strict'

describe 'Controller: TicketListCtrl', ->

  # load the controller's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  TicketListCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TicketListCtrl = $controller 'TicketListCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
