class CreatePayrolls < ActiveRecord::Migration
  def change
    create_table :payrolls do |t|
    	t.integer	:_type
    	t.integer 	:amount

    	t.integer	:user_id
      t.timestamps null: false
    end
  end
end
