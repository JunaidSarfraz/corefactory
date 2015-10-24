class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
    	t.string 		:name
    	t.string 		:address
    	t.string 		:city
    	t.string 		:country
    	t.integer 	:zip_code
    	t.string		:primary_phone
	t.string		:secondary_phone
	t.string		:email_address
	t.integer	:factory_id
	
      t.timestamps null: false
    end
  end
end
