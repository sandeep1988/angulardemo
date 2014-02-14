require "spec_helper"

describe PersonalsController do
  describe "routing" do

    it "routes to #index" do
      get("/personals").should route_to("personals#index")
    end

    it "routes to #new" do
      get("/personals/new").should route_to("personals#new")
    end

    it "routes to #show" do
      get("/personals/1").should route_to("personals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/personals/1/edit").should route_to("personals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/personals").should route_to("personals#create")
    end

    it "routes to #update" do
      put("/personals/1").should route_to("personals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/personals/1").should route_to("personals#destroy", :id => "1")
    end

  end
end
