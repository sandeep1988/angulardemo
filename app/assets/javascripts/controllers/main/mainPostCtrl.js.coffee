@PostCtrl = ($scope, $routeParams, postData) ->

  $scope.data =
    post: postData.data.posts[0]

  $scope.data.postId = $routeParams.postId
  console.log($routeParams)