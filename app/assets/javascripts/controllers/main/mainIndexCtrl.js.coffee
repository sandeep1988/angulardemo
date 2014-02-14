@IndexCtrl = ($scope, $location, $http, postData , personalData, commentData) ->

  $scope.data = 
    posts: [{title: 'Loading posts...', contents: ''}]

  loadPosts = ->
    $http.get('./posts.json').success( (data) ->
      $scope.data.posts = data
      console.log('Successfully loaded posts.')
    ).error( ->
      console.error('Failed to load posts.')
    )

  $scope.data = personalData.data

  personalData.loadPersonals(null)  

  $scope.data = postData.data

  postData.loadPosts(null)

  $scope.data = commentData.data

  commentData.loadComments(null)

  $scope.viewPost = (postId) ->
    $location.url('/post/'+postId)

  $scope.navNewPost = ->
    $location.url('/post/new')  

  $scope.navNewPersonal = ->
    $location.url('/personal/new')   

  $scope.viewComment = (commentId) ->
    $location.url('/comment/'+commentId)  

  $scope.navNewComment = ->
    $location.url('/comment/new')    

  loadPosts()

@IndexCtrl.$inject = ['$scope', '$location', '$http', 'postData' , 'personalData', 'commentData' ]
