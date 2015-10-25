class TypeAsEnumInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :is_admin
  	remove_column :users, :is_manager
  	remove_column :users, :is_worker
  	add_column :users, :_type, :integer
  end
end
