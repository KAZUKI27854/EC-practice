class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries
  has_many :cart_items, dependent: :destroy
  has_many :orders ,dependent: :destroy
  
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :address, :phone_number, :postcode, presence: true
end
