class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :oreders, through: :order_items
end
