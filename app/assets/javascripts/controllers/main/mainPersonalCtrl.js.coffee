@PersonalCtrl = ($scope, $routeParams, $location, $q, personalData) ->

  $scope.data =
    personalData: personalData.data
    currentPersonal:
      name: 'Loading...'
      age: ''
      address: ''
      phone_number: ''

  $scope.data.personalId = $routeParams.personalId

  $scope.navNewPersonal = ->
    $location.url('/personal/new')

  $scope.navNewPost = ->
    $location.url('/post/new')

  $scope.navHome = ->
    $location.url('/')


  # This will be run once the loadPosts successfully completes (or immediately
  ## if data is already loaded)
  $scope.prepPersonalData = ->
    personal = _.findWhere(personalData.data.personals, { id: parseInt($scope.data.personalId) })
    $scope.data.currentPersonal.name = personal.name
    $scope.data.currentPersonal.age = personal.age
    $scope.data.currentPersonal.address = personal.address
    $scope.data.currentPersonal.phone_number = personal.phone_number

  # Create promise to be resolved after personals load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepPersonalData)

  # Provide deferred promise chain to the loadpersonals function
  personalData.loadPersonals(@deferred)


@PersonalCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'personalData']