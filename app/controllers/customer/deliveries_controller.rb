class Customer::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = current_customer.deliveries
  end
end
