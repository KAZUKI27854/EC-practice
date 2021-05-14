class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.where(customer_id: current_customer)
  end
  
  def create
  end
end
