require "spec_helper"

module Kendocup
  RSpec.describe CupsController, type: :routing do
    describe "routing" do

      it "routes to #index" do
        expect(get: "/en/en/cups").to route_to("kendocup/cups#index")
      end

      it "routes to #new" do
        expect(get: "/en/cups/new").to route_to("kendocup/cups#new")
      end

      it "routes to #show" do
        expect(get: "/en/cups/1").to route_to("kendocup/cups#show", id: "1")
      end

      it "routes to #edit" do
        expect(get: "/en/cups/1/edit").to route_to("kendocup/cups#edit", id: "1")
      end

      it "routes to #create" do
        expect(post: "/en/cups").to route_to("kendocup/cups#create")
      end

      it "routes to #update" do
        expect(put: "/en/cups/1").to route_to("kendocup/cups#update", id: "1")
      end

      it "routes to #destroy" do
        expect(delete: "/en/cups/1").to route_to("kendocup/cups#destroy", id: "1")
      end

    end
  end
end
