class Customer::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = current_customer.deliveries
  end
  
  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_back(fallback_location: root_path)
    else
      @deliveries = current_customer.deliveries
      render :index
    end
  end
  
  private

    def delivery_params
      params.require(:delivery).permit(:postcode, :address, :name)
    end
end
