class CreateWorkDiaries < ActiveRecord::Migration
  def change
    create_table :work_diaries do |t|
    	t.integer	:user_id
    	t.integer	:pay_head_id
    	t.integer 	:number_of_items
    	
      t.timestamps null: false
    end
  end
end
