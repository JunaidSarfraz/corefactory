class CreateProductSuppliers < ActiveRecord::Migration
  def change
    create_table :product_suppliers do |t|
    	t.integer	:product_id
    	t.integer	:supplier_id
    	t.integer	:price
    	t.integer	:discount

      t.timestamps null: false
    end
  end
end
