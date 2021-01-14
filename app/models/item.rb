class Item < ApplicationRecord
  belings_to :user
  has_one:user_buy

  validates :image, presence: true
  validates :name, presence: true
  validates :text , presence: true
  validates :category_id, presence: true
  validates :state_id , presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9,999,999}


end
