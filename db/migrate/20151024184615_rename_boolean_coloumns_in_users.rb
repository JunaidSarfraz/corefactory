class RenameBooleanColoumnsInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :admin, :is_admin
  	rename_column :users, :manager, :is_manager
  	rename_column :users, :worker, :is_worker
  end
end
