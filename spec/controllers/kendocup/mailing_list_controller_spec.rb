require 'spec_helper'
module Kendocup
  RSpec.describe MailingListsController, type: :controller do

    routes { Kendocup::Engine.routes }

    let!(:cup) {create :kendocup_cup, start_on: Date.today+3.weeks}

    context "when not signed in" do
      describe "GET 'new'" do
        it "returns http success" do
          get 'new'
          expect(response).to be_success
        end
      end
    end

    context "when signed in" do
      before {
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = create :kendocup_user
        sign_in @user
      }

      describe "GET 'new'" do
        it "returns http success" do
          get 'new'
          expect(response).to be_success
        end
      end
    end
  end
end