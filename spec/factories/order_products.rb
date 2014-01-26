# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_product do
    order_id    1
    product_id  2
    price       20
    quantity    5
  end
end
