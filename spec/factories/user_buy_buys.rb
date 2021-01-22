FactoryBot.define do
  factory :user_buy_buy do
    postal_code { '634-6645' }
    prefecture_id { 2 }
    municipality { '明石市' }
    address  { '1632' }
    building_name { 'パールグレイス' }
    phone_number { '09054650076' }
    token { 'sk_test_8bf12a1bd90747b3799cd25a' }
    user_id { 1 }
    item_id { 1 }
    
  end
end

