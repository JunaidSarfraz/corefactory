class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date 		:order_date
      t.date 		:delivery_date
      t.references 	:orderable, polymorphic: true
      t.integer		:status
      t.integer		:company_id
      
      t.timestamps null: false
    end
  end
end
