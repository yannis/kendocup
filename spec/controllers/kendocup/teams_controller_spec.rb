require 'spec_helper'
module Kendocup
  RSpec.describe TeamsController, type: :controller do

    routes { Kendocup::Engine.routes }

    let!(:cup){create :kendocup_cup, start_on: Date.current+2.days}

    describe "with 3 teams in the database," do
      let(:user) {create :kendocup_user}
      let(:user2) {create :kendocup_user, :admin => true}
      let(:team1) {create :kendocup_team, :name => 'team1'}
      let(:team2) {create :kendocup_team, :name => 'team2'}
      let(:team3) {create :kendocup_team, :name => 'team3'}

      context "when not logged in," do

        describe "on GET to :index without param,"do
          before do
            get :index, cup_id: cup.to_param
          end

          it {response.should be_success}
          it {assigns(:teams).should_not be_nil}
          it {response.should render_template(:index)}
          it {assigns(:teams).should =~ [team1, team2, team3]}
          it {flash.should be_empty}
        end

        describe "when GET to :show for team1.id," do
          before :each do
            get :show, cup_id: cup.to_param, :id => team1.to_param
          end

          it {response.should be_success}
          it {assigns(:team).should == team1}
          it {response.should render_template(:show)}
          it {flash.should be_empty}
        end
      end

      describe "when logged in as basic" do
        let(:basic_user){ create :kendocup_user }
        before{ sign_in basic_user }

        describe "on GET to :index without param," do
          before :each do
            get :index, cup_id: cup.to_param
          end

          it{ basic_user.should be_valid_verbose}
          it {assigns(:teams).should_not be_nil}
          it {response.should render_template(:index)}
          it {assigns(:teams).should =~ [team1, team2, team3]}
          it {flash.should be_empty}
        end

        describe "when GET to :show for team1.id," do
          before :each do
            get :show, :id => team1.to_param, cup_id: cup.to_param
          end

          it {response.should be_success}
          it {assigns(:team).should_not be_nil}
          it {response.should render_template(:show)}
          it {flash.should be_empty}
          it "assigns team to team1" do
            assigns(:team).should eql team1
          end
        end

      end
    end
  end
end
