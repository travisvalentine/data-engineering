require 'spec_helper'

describe User do
  let(:user)  { FactoryGirl.build(:user) }

  describe "validations" do
    it "is valid" do
      user.should be_valid
    end

    it "is not valid without an email" do
      user.email = nil
      user.should_not be_valid
    end

    it "is not valid without a password" do
      user.password = nil
      user.should_not be_valid
    end
  end

end