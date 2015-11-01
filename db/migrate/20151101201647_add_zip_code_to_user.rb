class AddZipCodeToUser < ActiveRecord::Migration
  def change
 	add_column :users, :zip_code, :integer, default: 0000
  end
end
