class OrderProduct < ActiveRecord::Base
  attr_accessible :price, :quantity, :product_id

  belongs_to :order
  belongs_to :product

  validates_presence_of     :price
  validates_numericality_of :price

  validates_presence_of     :quantity
  validates_numericality_of :quantity

  validates_presence_of     :order_id
  validates_presence_of     :product_id

  def total_price
    price * quantity
  end
end
