require "spec_helper"

module Kendocup
  RSpec.describe CupsController, :type => :routing do
    describe "routing" do

      it "routes to #index" do
        expect(:get => "/cups").to route_to("cups#index")
      end

      it "routes to #new" do
        expect(:get => "/cups/new").to route_to("cups#new")
      end

      it "routes to #show" do
        expect(:get => "/cups/1").to route_to("cups#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/cups/1/edit").to route_to("cups#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/cups").to route_to("cups#create")
      end

      it "routes to #update" do
        expect(:put => "/cups/1").to route_to("cups#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/cups/1").to route_to("cups#destroy", :id => "1")
      end

    end
  end
end
