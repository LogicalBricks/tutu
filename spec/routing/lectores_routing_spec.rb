require "spec_helper"

describe LectoresController do
  describe "routing" do

    it "routes to #index" do
      get("/lectores").should route_to("lectores#index")
    end

    it "routes to #new" do
      get("/lectores/new").should route_to("lectores#new")
    end

    it "routes to #show" do
      get("/lectores/1").should route_to("lectores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lectores/1/edit").should route_to("lectores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lectores").should route_to("lectores#create")
    end

    it "routes to #update" do
      put("/lectores/1").should route_to("lectores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lectores/1").should route_to("lectores#destroy", :id => "1")
    end

  end
end
