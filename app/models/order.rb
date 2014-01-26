class Order < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :merchant

  validates_presence_of :purchaser_id
  validates_presence_of :merchant_id

  has_many :order_products
end
