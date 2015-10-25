class MakeBloodGroupAEnumInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :blood_group
  	add_column :users, :blood_group, :integer
  end
end
