require 'spec_helper'

module Kendocup
  RSpec.describe Admin::CupsController, type: :controller do

    let!(:cup){create :kendocup_cup}

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, id: cup.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, id: cup.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #destroy" do
      before {get :destroy, id: cup.id}
      it "returns http success" do
        expect(response).to redirect_to("/")
      end
      it {expect(assigns(:cup)).to eql cup}
    end

  end
end
