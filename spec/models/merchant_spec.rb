require 'spec_helper'

describe Merchant do
  let(:merchant)  { FactoryGirl.build(:merchant) }

  describe "validations" do
    it "is valid" do
      merchant.should be_valid
    end

    it "is not valid without a name" do
      merchant.name = nil
      merchant.should_not be_valid
    end

    it "is not valid without an address" do
      merchant.address = nil
      merchant.should_not be_valid
    end
  end

  describe "associations" do
    it "can associate with an order" do
      order = FactoryGirl.build(:order)
      merchant.orders << order
      merchant.orders.should include(order)
    end
  end
end
