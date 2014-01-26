require 'spec_helper'

describe OrderProduct do
  let(:order_product)  { FactoryGirl.build(:order_product) }

  describe "validations" do
    it "is valid" do
      order_product.should be_valid
    end

    it "is not valid without a quantity" do
      order_product.quantity = nil
      order_product.should_not be_valid
    end

    it "is not valid without a numeric quantity" do
      order_product.quantity = "HI"
      order_product.should_not be_valid
    end

    it "is not valid without a price" do
      order_product.price = nil
      order_product.should_not be_valid
    end

    it "is not valid without a numeric price" do
      order_product.price = "HI"
      order_product.should_not be_valid
    end

    it "is not valid without an order" do
      order_product.order_id = nil
      order_product.should_not be_valid
    end

    it "is not valid without a product" do
      order_product.product_id = nil
      order_product.should_not be_valid
    end

  end

end
