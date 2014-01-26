require 'spec_helper'

describe Order do
  let(:order)  { FactoryGirl.build(:order) }

  describe "validations" do
    it "is valid" do
      order.should be_valid
    end

    it "is not valid without a purchaser" do
      order.purchaser_id = nil
      order.should_not be_valid
    end

    it "is not valid without a merchant" do
      order.merchant_id = nil
      order.should_not be_valid
    end
  end
end
