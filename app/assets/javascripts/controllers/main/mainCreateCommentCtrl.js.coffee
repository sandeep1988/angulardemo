@CreateCommentCtrl = ($scope, $location, commentData) ->

  $scope.data = commentData.data
  commentData.loadComments()

  $scope.formData =
    newCommentName: ''

  $scope.createComment = ->
    commentData.createComment($scope.formData)
    $location.url('/')

  $scope.clearComment = ->
    $scope.formData.newCommentName = ''

  $scope.navNewComment = ->
    $location.url('/comment/new')

  $scope.navHome = ->
    $location.url('/')

@CreateCommentCtrl.$inject = ['$scope', '$location', 'commentData']