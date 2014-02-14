# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#= require_self
#= require_tree ./services/global
#= require_tree ./services/main
#= require_tree ./filters/global
#= require_tree ./filters/main
#= require_tree ./controllers/global
#= require_tree ./controllers/main
#= require_tree ./directives/global
#= require_tree ./directives/main

# Creates Angular module called 'Demo12'
Demo12 = angular.module('Demo12', [])



# Sets up routing
Demo12.config(['$routeProvider', ($routeProvider) ->
 
  $routeProvider.when('/post/new',{ templateUrl: '../assets/mainCreatePost.html', controller: 'CreatePostCtrl'})  
  $routeProvider.when('/post/:postId', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl' } )
  $routeProvider.when('/personal/new',{ templateUrl: '../assets/mainCreatePersonal.html', controller: 'CreatePersonalCtrl'})
  $routeProvider.when('/personal/:personalId', { templateUrl: '../assets/mainPersonal.html', controller: 'PersonalCtrl' } )
  $routeProvider.when('/comment/new',{ templateUrl: '../assets/mainCreateComment.html', controller: 'CreateCommentCtrl'})  
  $routeProvider.when('/comment/:commentId', { templateUrl: '../assets/mainComment.html', controller: 'CommentCtrl' } )
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' } )

])