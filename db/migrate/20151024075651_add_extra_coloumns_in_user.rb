class AddExtraColoumnsInUser < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, 		:string
  	add_column :users, :middle_name, 		:string
  	add_column :users, :last_name, 		:string
  	add_column :users, :cnic,				:string
  	add_column :users, :religion,			:string
  	add_column :users, :gender,			:integer
  	add_column :users, :cast,				:string
  	add_column :users, :height,				:string
      # Blood group is changed to an enum in the next migration
  	add_column :users, :blood_group,		:string
  	add_column :users, :address,			:string
  	add_column :users, :city, 				:string
  	add_column :users, :country, 			:string
  	add_column :users, :primary_phone	,	:string
  	add_column :users, :secondary_phone,	:string
  	add_column :users,	:join_date,			:date
  	add_column :users, :manager_id,		:integer
  	add_column :users, :branch_id,			:integer
  end
end
