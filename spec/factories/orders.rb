# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    purchaser_id  1
    merchant_id   2
  end
end
