require "spec_helper"

describe ProductDisplaysController do
  describe "routing" do

    it "routes to #index" do
      get("/product_displays").should route_to("product_displays#index")
    end

    it "routes to #new" do
      get("/product_displays/new").should route_to("product_displays#new")
    end

    it "routes to #show" do
      get("/product_displays/1").should route_to("product_displays#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_displays/1/edit").should route_to("product_displays#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_displays").should route_to("product_displays#create")
    end

    it "routes to #update" do
      put("/product_displays/1").should route_to("product_displays#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_displays/1").should route_to("product_displays#destroy", :id => "1")
    end

  end
end
