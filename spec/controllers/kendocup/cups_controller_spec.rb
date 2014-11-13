require 'spec_helper'

module Kendocup
  RSpec.describe CupsController, :type => :controller do

    routes { Kendocup::Engine.routes }

    let!(:cup1){create :kendocup_cup, start_on: Date.current, events: [create(:kendocup_event)] }
    let(:cup2){create :kendocup_cup, start_on: Date.current-2.years}
    let(:cup3){create :kendocup_cup, start_on: Date.current+1.year}


    context "When not logged in" do
      describe "when GET to :show for cup1," do
        before {  get :show, {year: Date.current.year, :use_route => :cups} }

        it {response.should be_success}
        it {assigns(:cup).should_not be_nil}
        it {response.should render_template(:show)}
        it {flash.should be_empty}
        it {assigns(:cup).should eql cup1}
      end
    end
  end
end
