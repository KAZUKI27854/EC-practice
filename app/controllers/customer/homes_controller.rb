class Customer::HomesController < ApplicationController
  def top
    @items = Item.all.order(updated_at: :desc).limit(4)
  end
end
