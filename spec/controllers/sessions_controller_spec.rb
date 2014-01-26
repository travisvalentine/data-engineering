require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      post :create
      response.should be_success
    end

    it "renders the new action if User not authenticated" do

    end
  end

end