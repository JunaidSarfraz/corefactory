class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    	t.string		:title
    	t.text		:description
    	t.integer	:_type
    	t.string		:bank_account_number
    	t.string		:bank_name
    	t.text		:bank_address
    	t.string		:bank_city
    	t.integer	:current_balance

    	t.integer 	:user_id
      t.timestamps null: false
    end
  end
end
