class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :user_buys

  validates :nick_name, presence: true
  validates :email  , uniqueness: true
  validates :encrypted_password, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }, confirmation: true
  validates :last_name , presence: true
  validates :first_name  , presence: true
  validates :last_name_kana , presence: true
  validates :first_name_kana , presence: true
  validates :birthday  , presence: true
         
end
