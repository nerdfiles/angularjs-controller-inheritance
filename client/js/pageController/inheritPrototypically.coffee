 # @fileOverview
 # A child controller that inherits the functionality of a parent via standard
 # Javascript prototypical inheritance.
(() ->

  inheritance = angular.module 'inheritance'

  # A child controller that inherits the functionality of a parent via standard
  # Javascript prototypical inheritance.
  InheritPrototypicallyController ($scope) ->
    # We can avoid passing long argument lists explicitly by suitably ordering
    # the injected dependencies. This is pleasant when the number of services
    # starts growing.
    InheritPrototypicallyController.super_.apply @, arguments
  # See /js/app.js for the definition of inheritance.inherits().
  inheritance.inherits InheritPrototypicallyController, inheritance.BasePrototypeFunctionalityControllerConstructor
  p = InheritPrototypicallyController.prototype

  # Override a parent method.
  #
  # @see BasePrototypeFunctionality#setControllerName
  p.setControllerName = () ->
    @$scope.controllerName = 'inheritPrototypicallyController'

  inheritance.InheritPrototypicallyControllerConstructor = InheritPrototypicallyController
  inheritance.controller 'inheritPrototypicallyController', [
    '$scope'
    InheritPrototypicallyController
  ]

)()
