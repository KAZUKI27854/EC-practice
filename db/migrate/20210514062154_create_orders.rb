class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage
      t.integer :total_price
      t.integer :payment_method
      t.integer :status
      t.string :delivery_name
      t.string :delivery_postcode
      t.string :delivery_address
      t.timestamps
    end
  end
end
