require 'spec_helper'

describe UploadsController do
  let(:user) { FactoryGirl.build(:user) }

  describe "GET new" do
    context "when current_user is assigned" do
      before do
        controller.stub(:current_user).and_return(user)
      end

      it "returns http success when current_user is assigned" do
        get :new
        response.should be_success
      end
    end

    context "without a current_user" do
      it "redirects to sessions#new when no current_user" do
        get :new
        response.should be_redirect
      end
    end
  end

  describe "POST create" do
    context "with a current_user" do
      before do
        controller.stub(:current_user).and_return(user)
      end

      it "renders the new action if File is nil" do
        post :create
        response.should redirect_to new_upload_path
      end
    end

    context "without a current_user" do
      it "redirects to sessions#new when no current_user" do
        post :create, file: nil
        response.should be_redirect
      end
    end
  end

end