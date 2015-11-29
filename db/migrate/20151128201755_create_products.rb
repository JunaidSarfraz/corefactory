class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string      :name
      t.string      :description
      t.string      :_type
      t.string      :category
      t.integer    :product_supplier_id
      t.integer    :company_id
      t.integer    :cost
      t.integer    :sale_price
      t.integer    :max_discount

      t.timestamps null: false
    end
  end
end
