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

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
