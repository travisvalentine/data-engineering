require 'spec_helper'

describe Product do
  let(:product)  { FactoryGirl.build(:product) }

  describe "validations" do
    it "is valid" do
      product.should be_valid
    end

    it "is not valid without a description" do
      product.description = nil
      product.should_not be_valid
    end

    it "is not valid without a price" do
      product.price = nil
      product.should_not be_valid
    end

    it "is not valid without a numeric price" do
      product.price = "HI"
      product.should_not be_valid
    end

  end

end
