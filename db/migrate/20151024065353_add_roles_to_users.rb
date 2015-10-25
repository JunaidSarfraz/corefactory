class AddRolesToUsers < ActiveRecord::Migration
  def change
  	#these coloumns are deleted
  	# we are teating these as enum type now.
  	add_column :users, :admin, :boolean, default: false
  	add_column :users, :manager, :boolean, default: false
  	add_column :users, :worker, :boolean, default: false
  end
end
