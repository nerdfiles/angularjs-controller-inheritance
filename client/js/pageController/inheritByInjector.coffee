# @fileOverview
# A child controller that inherits the functionality of a parent via the
# $injector.invoke() method.

(() ->
  'use strict'
  inheritance = angular.module 'inheritance'

  # A child controller that inherits the functionality of a parent via the
  # $injector.invoke() method.
  InheritByInjectorController ($injector, $scope) ->
    # Override a parent controller function. We have to do this before calling
    # $injector.invoke(). But leave it open to further overriding by child
    # classes.
    @setControllerName = @setControllerName || () ->
      $scope.controllerName = 'inheritByInjectorController'

    # Using the injector like this is not the same as prototypical inheritance.
    # No prototype functions are brought over, only what is attached to (this)
    # in the parent controller constructor.
    $injector.invoke inheritance.BaseNoPrototypeFunctionalityControllerConstructor, @, {
      $scope: $scope
    }

  inheritance.InheritByInjectorControllerConstructor = InheritByInjectorController
  inheritance.controller 'inheritByInjectorController', [
    '$injector',
    '$scope',
    InheritByInjectorController
  ]

)()
