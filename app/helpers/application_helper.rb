module ApplicationHelper

  def customer_full_name(customer_id)
    customer = Customer.find_by(id: customer_id)
    customer.last_name + customer.first_name
  end

  def cart_item(cartitem_id)
    cartitem = CartItem.find_by(id: cartitem_id)
    Item.find_by(id: cartitem.item_id)
  end

  def tax_price(item_id)
    tax = 0.1
    market_price = Item.find_by(id: item_id).price
    market_price * (1 + tax)
  end

  def sub_price(cartitem_id)
    cart_item = CartItem.find_by(id: cartitem_id)
    item = Item.find_by(id: cart_item.item_id)
    tax_price(item.id) * cart_item.quantity
  end
end
