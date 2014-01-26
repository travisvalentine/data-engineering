require 'spec_helper'
include ActionDispatch::TestProcess

describe DataUpload do
  let(:rows) { [
    ["purchaser name", "item description", "item price", "purchase count", "merchant address", "merchant name"],
    ["Snake Plissken", "$10 off $20 of food", "10.0", "2", "987 Fake St", "Bob's Pizza"]
  ]}

  before do
    file = double(tempfile: double)
    @new_upload = DataUpload.new(file)
    @new_upload.stub(:valid?).and_return(true)
    CSV.stub(:parse).and_return(rows)
  end

  describe "validations" do
    it "is invalid without a file" do
      DataUpload.new(nil).should_not be_valid
    end

    it "has an error message when file not present" do
      upload = DataUpload.new(nil)
      upload.valid?
      upload.errors[:file].should eq(["can't be blank"])
    end
  end

  describe "#create_purchaser" do
    it "creates a purchaser from purchaser's name" do
      expect {
        @new_upload.create_purchaser(rows[1][0])
      }.to change { Purchaser.count }.by(1)
    end
  end

  describe "#create_merchant" do
    it "creates a merchant from a merchant's address and name" do
      expect {
        @new_upload.create_merchant(rows[1][4], rows[1][5])
      }.to change { Merchant.count }.by(1)
    end
  end

  describe "#create_product" do
    it "creates a product from a product's description and price" do
      expect {
        @new_upload.create_product(rows[1][1], rows[1][2])
      }.to change { Product.count }.by(1)
    end
  end

  describe "#create_order" do
    it "creates an order" do
      expect {
        @new_upload.create_order(1, 2, 3, rows[1][2], rows[1][3])
      }.to change { Order.count }.by(1)
    end

    it "creates an order product" do
      expect {
        @new_upload.create_order(1, 2, 3, rows[1][2], rows[1][3])
      }.to change { OrderProduct.count }.by(1)
    end
  end

  describe "#gross_revenue" do
    it "calls the sum of all orders price times quantity" do
      @new_upload.process!
      @new_upload.gross_revenue.should eq("$20.00")
    end
  end

end