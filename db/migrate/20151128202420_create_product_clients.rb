class CreateProductClients < ActiveRecord::Migration
  def change
    create_table :product_clients do |t|
    	t.integer	:product_id
    	t.integer	:client_id
    	t.integer	:price
    	t.integer	:discount

      t.timestamps null: false
    end
  end
end
