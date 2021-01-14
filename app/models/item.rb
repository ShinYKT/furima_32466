class Item < ApplicationRecord
  belongs_to :user
  has_one:user_buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :state


  validates :image, presence: true
  validates :name, presence: true
  validates :text , presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :state_id , numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }
  with_options presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
    validates :price
  end


end
