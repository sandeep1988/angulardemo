@CommentCtrl = ($scope, $routeParams, commentData) ->

  $scope.data =
    commentData: commentData.data
    currentPost:
      name: 'Loading...'

  $scope.data.commentId = $routeParams.commentId
  

  $scope.navNewComment = ->
    $location.url('/comment/new')

  $scope.navHome = ->
    $location.url('/')

  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)

  $scope.prepCommentData = ->
    comment = _.findWhere(commentData.data.posts, { id: parseInt($scope.data.commentId) })
    $scope.data.currentComment.name = comment.title
    
  # Create promise to be resolved after posts load

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepCommentData)

  # Provide deferred promise chain to the loadPosts function
  commentData.loadComments(@deferred)


@CommentCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'commentData']