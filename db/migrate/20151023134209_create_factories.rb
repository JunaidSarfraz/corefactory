class CreateFactories < ActiveRecord::Migration
  def change
    create_table :factories do |t|
    	t.string 		:name
    	t.text 		:vision
    	t.text 		:work_description
    	t.string 		:email
    	t.string 		:password_of_factory_email
    	t.string 		:primary_phone
    	t.string 		:secondary_phone
    	t.text		:tax_information
    	t.integer 	:user_id

      t.timestamps null: false
    end
  end
end
