class CreateTransections < ActiveRecord::Migration
  def change
    create_table :transections do |t|
    	t.integer	:payment_type
    	t.text		:description
    	t.integer	:submitted_account_id
    	t.integer	:withdrawn_account_id
      
      t.timestamps null: false
    end
  end
end
