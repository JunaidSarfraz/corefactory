class AddDisabledColumnInUsers < ActiveRecord::Migration
  def change
  	add_column :users, :disabled, :boolean, :default => true
  end
end
