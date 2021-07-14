class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_current_customer

  def show
  end
  
  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end
  
  private
  
    def set_current_customer
      @customer = current_customer
    end
  
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
    end
end
