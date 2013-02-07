require "spec_helper"

describe PrestamosController do
  describe "routing" do

    it "routes to #index" do
      get("/prestamos").should route_to("prestamos#index")
    end

    it "routes to #new" do
      get("/prestamos/new").should route_to("prestamos#new")
    end

    it "routes to #show" do
      get("/prestamos/1").should route_to("prestamos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/prestamos/1/edit").should route_to("prestamos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/prestamos").should route_to("prestamos#create")
    end

    it "routes to #update" do
      put("/prestamos/1").should route_to("prestamos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/prestamos/1").should route_to("prestamos#destroy", :id => "1")
    end

  end
end
