require 'csv'

class DataUpload
  include ActiveModel::Validations
  include ActionView::Helpers::NumberHelper

  attr_accessor :file, :sum

  validates_presence_of :file

  def initialize(file)
    @file = file
    @sum  = 0
  end

  def process!
    rows = CSV.parse(file.tempfile, { :col_sep => "\t" })
    rows.each_with_index do |row, index|
      next if index == 0
      purchaser_name      = row[0]
      product_description = row[1]
      price               = row[2]
      quantity            = row[3]
      merchant_address    = row[4]
      merchant_name       = row[5]

      purchaser = create_purchaser(purchaser_name)
      merchant  = create_merchant(merchant_address, merchant_name)
      product   = create_product(product_description, price)

      create_order(merchant.id, purchaser.id, product.id, price, quantity)

      sum_gross_revenue(price, quantity)
    end
  end

  def create_purchaser(purchaser_name)
    Purchaser.where(name: purchaser_name).first_or_create
  end

  def create_merchant(address, name)
    Merchant.where(name: name, address: address).first_or_create
  end

  def create_product(description, price)
    Product.where(description: description, price: price).first_or_create
  end

  def create_order(merchant_id, purchaser_id, product_id, price, quantity)
    order = Order.where(merchant_id: merchant_id, purchaser_id: purchaser_id).first_or_create
    order.order_products.create(price: price, quantity: quantity, product_id: product_id)
  end

  def sum_gross_revenue(price, quantity)
    @sum += (price.to_f * quantity.to_i)
  end

  def gross_revenue
    number_to_currency(@sum) rescue 0
  end
end