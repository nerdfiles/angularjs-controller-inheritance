# @fileOverview
# An "abstract" base controller function that defines functionality in
# its prototype rather than in the function body.
(() ->
  'use strict'

  inheritance = angular.module 'inheritance'

  # An "abstract" base controller function that defines functionality in
  # its prototype rather than in the function body.
  BasePrototypeFunctionalityController ($scope) ->
    @$scope = $scope
    @initialize()
  p = BasePrototypeFunctionalityController.prototype

  # Set the controller name in the scope.
  p.setControllerName = () ->
    @$scope.controllerName = 'basePrototypeFunctionalityController'

  # Initialize the controller. Called on instantiation.
  p.initialize = () ->
    @setControllerName()

  inheritance.BasePrototypeFunctionalityControllerConstructor = BasePrototypeFunctionalityController
)()
