class Item < ApplicationRecord
  belongs_to :user
  has_one:user_buy
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :text , presence: true
  validates :category_id, presence: true
  validates :state_id , presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  with_options presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
    validates :price
  end


end
