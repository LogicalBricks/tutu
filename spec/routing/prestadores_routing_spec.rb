require "spec_helper"

describe PrestadoresController do
  describe "routing" do

    it "routes to #index" do
      get("/prestadores").should route_to("prestadores#index")
    end

    it "routes to #new" do
      get("/prestadores/new").should route_to("prestadores#new")
    end

    it "routes to #show" do
      get("/prestadores/1").should route_to("prestadores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/prestadores/1/edit").should route_to("prestadores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/prestadores").should route_to("prestadores#create")
    end

    it "routes to #update" do
      put("/prestadores/1").should route_to("prestadores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/prestadores/1").should route_to("prestadores#destroy", :id => "1")
    end

  end
end
