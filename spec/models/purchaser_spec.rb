require 'spec_helper'

describe Purchaser do
  let(:purchaser)  { FactoryGirl.build(:purchaser) }

  describe "validations" do
    it "is valid" do
      purchaser.should be_valid
    end

    it "is not valid without a name" do
      purchaser.name = nil
      purchaser.should_not be_valid
    end

  end

  describe "associations" do
    it "can associate with an order" do
      order = FactoryGirl.build(:order)
      purchaser.orders << order
      purchaser.orders.should include(order)
    end
  end

end