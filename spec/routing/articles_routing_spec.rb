require "spec_helper"

describe ArticlesController do
  describe "routing" do

    it "routes to #index" do
      get("/wiki").should route_to("articles#index")
    end

    it "routes to #new" do
      get("/wiki/new").should route_to("articles#new")
    end

    it "routes to #show" do
      get("/wiki/1").should route_to("articles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wiki/1/edit").should route_to("articles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wiki").should route_to("articles#create")
    end

    it "routes to #update" do
      put("/wiki/1").should route_to("articles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wiki/1").should route_to("articles#destroy", :id => "1")
    end

  end
end
