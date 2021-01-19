FactoryBot.define do
  factory :item do
    name { 'test' }
    text { 'test' }
    category_id { 2 }
    state_id  { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
    price { 400 }
    association :user
  end
end
