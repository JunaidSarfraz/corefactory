class CreatePayHeads < ActiveRecord::Migration
  def change
    create_table :pay_heads do |t|
    	t.string		:name
    	t.text		:work_description
    	t.integer	:pay
    	t.integer 	:number_of_items

    	t.integer 	:contract_id
      t.timestamps null: false
    end
  end
end