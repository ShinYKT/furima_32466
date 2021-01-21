class Buy < ApplicationRecord
　belongs_to :user_buy

  with_options presence: true do
    varidates :postal_code
    varidates :prefectture_id
    varidates :municipality
    varidates :addres
    varidates :building_name
    varidates :phone_number
  end



end

