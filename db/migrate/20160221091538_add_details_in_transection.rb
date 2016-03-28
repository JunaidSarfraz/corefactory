class AddDetailsInTransection < ActiveRecord::Migration
  def change
  	add_column :transections, :status, :integer
  	add_column :transections, :checque_date, :date
  	add_column :transections, :transection_date, :date
  end
end
