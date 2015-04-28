require "spec_helper"

module Kendocup
  RSpec.describe CupsController, type: :routing do
    routes { Kendocup::Engine.routes }

    describe "routing" do

      it "routes to #index" do
        expect(get: "cups").to route_to("kendocup/cups#index")
      end

      it "routes to #show" do
        expect(get: "cups/1").to route_to("kendocup/cups#show", id: "1")
      end
    end
  end
end
