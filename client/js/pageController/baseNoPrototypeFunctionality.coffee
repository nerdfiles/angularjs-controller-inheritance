# @fileOverview
# An "abstract" base controller function that doesn't define functionality in
# its prototype, but rather in the function body.
(() ->
  'use strict'

  inheritance = angular.module 'inheritance'

  # An "abstract" base controller function that doesn't define functionality in
  # its prototype, but rather in the function body.
  #
  # Note that function definitions must be set to allow child controllers to
  # override them by specifying the function in advance of invoking this
  # parent controller function. i.e.:
  #
  # this.fn = this.fn || function () {};
  BaseNoPrototypeFunctionalityController ($scope) ->
    # Set the controller name in the scope.
    @setControllerName = @setControllerName || () ->
      $scope.controllerName = 'alphaController'

    # Initialize the controller. Called on instantiation.
    @initialize = @initialize || () ->
      @setControllerName()

    @initialize()

  inheritance.BaseNoPrototypeFunctionalityControllerConstructor = BaseNoPrototypeFunctionalityController
)()
