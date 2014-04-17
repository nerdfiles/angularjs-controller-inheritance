# @fileOverview
# A child controller that inherits from multiple parents via the $injector
# method.
(() ->
  'use strict'

  inheritance = angular.module('inheritance');

  # A child controller that inherits from multiple parents via the $injector
  # method.
  MixinByInjectorController ($injector, $scope) ->
    # Override a parent controller function. We have to do this before calling
    # $injector.invoke(). But leave it open to further overriding by child
    # classes.
    @setControllerName = @setControllerName || () ->
      $scope.controllerName = 'mixinByInjectorController'

    # Decorate the scope with this detector function.
    $scope.mixinPrototypeFunctionsInherited = () ->
      typeof self.mixinPrototypeFunction == 'function'

    # Mixin multiple parent controllers.
    $injector.invoke inheritance.BaseMixinControllerConstructor, @, {
      $scope: $scope
    }
    $injector.invoke inheritance.InheritByInjectorControllerConstructor, @, {
      $injector: $injector
      $scope: $scope
    }

  inheritance.MixinByInjectorControllerConstructor = MixinByInjectorController
  inheritance.controller 'mixinByInjectorController', [
    '$injector'
    '$scope'
    MixinByInjectorController
  ]

)()
