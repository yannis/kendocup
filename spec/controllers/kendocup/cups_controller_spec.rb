require 'spec_helper'

module Kendocup
  RSpec.describe CupsController, type:  :controller do

    routes { Kendocup::Engine.routes }

    let!(:cup1){create :kendocup_cup, start_on: Date.current+2.months, events: [create(:kendocup_event)] }
    let(:cup2){create :kendocup_cup, start_on: Date.current-2.years}
    let(:cup3){create :kendocup_cup, start_on: Date.current+1.year}


    context "When not logged in" do
      describe "when GET to :show for cup1," do
        before {  get :show, {id: Date.current.year, :use_route => :cups} }

        it {expect(response).to be_success}
        it {expect(assigns(:cup)).to_not be_nil}
        it {expect(response).to render_template(:show)}
        it {expect(flash).to be_empty}
        it {expect(assigns(:cup)).to eql cup1}
      end
    end
  end
end
