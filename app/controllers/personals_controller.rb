class PersonalsController < ApplicationController
  respond_to :json

  def index

     # Gather all post data
     personals = Personal.all

     # Respond to request with personal data in json format
     respond_with(personals) do |format|
       format.json { render :json => personals.as_json }
     end

  end


  def create
  
    # Create and save new personal from data received from the client
    new_personal = Personal.new
    new_personal.name = params[:new_personal][:name][0...50] # Get only first 250 characters
    new_personal.age = params[:new_personal][:age]
    new_personal.address = params[:new_personal][:address]
    new_personal.phone_number = params[:new_personal][:phone_number]

    # Confirm personal is valid and save or return HTTP error
    if new_personal.valid?
      new_personal.save!
    else
      render "public/422", :status => 422
      return
    end

    # Respond with newly created personal in json format
    respond_with(new_personal) do |format|
      format.json { render :json => new_personal.as_json }
    end

  end

end
