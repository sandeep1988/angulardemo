@CreatePersonalCtrl = ($scope, $location, personalData) ->

  $scope.data = personalData.data
  personalData.loadPersonals(null)

  $scope.formData =
    newPersonalName: ''
    newPersonalAge: ''
    newPersonalAddress: ''
    newPersonalPhone: ''

  $scope.createPersonal = ->
    personalData.createPersonal($scope.formData)
    $location.url('/')
    

  $scope.clearPersonal = ->
    $scope.formData.newPersonalName = ''
    $scope.formData.newPersonalAge = ''
    $scope.formData.newPersonalPhone = ''

  $scope.navNewPersonal = ->
    $location.url('/personal/new')    

  $scope.navNewPost = ->
    $location.url('/post/new')

  $scope.navHome = ->
    $location.url('/')

@CreatePersonalCtrl.$inject = ['$scope', '$location', 'personalData']
