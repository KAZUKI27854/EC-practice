class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
    current_customer = Customer.find(1)
    @my_postcode = current_customer.postcode
    @my_address = current_customer.address
    #@delivery_address_list = Delivery.where(customer_id: current_customer.id)

    #cart_items = current_customer.cart_items
    #if cart_items.empty?
       #redirect_to customers_cart_items_path
    #end
  end

  def confirm
    @current_customer = Customer.first
    @cart_items = CartItem.where(customer_id: @current_customer.id)
    @order = Order.new(order_params)
    @postage = 800
  end

  def create
    @order = current_customer.order.new(order_params)
  end

  def show
  end

  private

  def order_params
   params.require(:order).permit(:customer_id, :postage, :total_price, :payment_method, :status,
                                 :delivery_name, :delivery_postcode, :delivery_address,
   order_items_attributes:[:item_id, :order_id, :quantity, :market_price, :product_status])
  end
end
