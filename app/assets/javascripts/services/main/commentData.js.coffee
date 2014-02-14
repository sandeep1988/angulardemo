angular.module('Demo12').factory('commentData', ['$http', ($http) ->

  commentData =
    data:
      comments: {name: 'Loading'}
    isLoaded: false


  commentData.createComment = (newComment) ->
   
    # Create data object to POST
    data =
      new_comment:
        name: newComment.newCommentName
    
    # Do POST request to /posts.json
    $http.post('./comments.json', data).success( (data) ->

      # Add new post to array of posts
      commentData.data.posts.push(data)
      console.log('Successfully created commentData.')

    ).error( ->
      console.error('Failed to create new commentData.')
    )

    return true


  commentData.loadComments = (deferred) ->
    if !commentData.isLoaded
      $http.get('./comments.json').success( (data) ->
        commentData.data.posts = data
        commentData.isLoaded = true
        console.log('Successfully loaded comment.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load commentData.')
        if deferred
          deferred.reject('Failed to load comment.')
      )
    else
      if deferred
        deferred.resolve()
    

  return commentData

])
