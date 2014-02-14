class CommentsController < ApplicationController
	respond_to :json

  def index

    # Gather all post data
    comments = Comment.all
    # Respond to request with post data in json format
    respond_with(comments) do |format|
      format.json { render :json => comments.as_json }
    end
  end

  def create
    # Create and save new post from data received from the client
    new_comment = Comment.new
    new_comment.name = params[:new_comment][:name]	 # Get only first 250 characters

    # Confirm post is valid and save or return HTTP error
    if new_comment.valid?
      new_comment.save!
    else
      render "public/422", :status => 422
      return
    end

    # Respond with newly created post in json format
    respond_with(new_comment) do |format|
      format.json { render :json => new_comment.as_json }
    end

  end

end