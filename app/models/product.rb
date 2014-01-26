class Product < ActiveRecord::Base
  validates_presence_of     :description

  validates_presence_of     :price
  validates_numericality_of :price
end
