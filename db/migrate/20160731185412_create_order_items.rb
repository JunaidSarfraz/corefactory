class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer  :product_id
      t.string   :product_description
      t.integer  :cost
      t.integer  :discount
      t.integer  :quantity
      t.integer  :order_id

      t.timestamps null: false
    end
  end
end
