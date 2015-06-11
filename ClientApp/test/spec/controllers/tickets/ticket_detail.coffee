'use strict'

describe 'Controller: TicketDetailCtrl', ->

  # load the controller's module
  beforeEach module 'nttcomApiGatewayWebappApp'

  TicketDetailCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TicketDetailCtrl = $controller 'TicketDetailCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
