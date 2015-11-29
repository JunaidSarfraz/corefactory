class AddClientCompanyIdInUsers < ActiveRecord::Migration
  def change
  	add_column :users, :client_company_id, :integer
  end
end
