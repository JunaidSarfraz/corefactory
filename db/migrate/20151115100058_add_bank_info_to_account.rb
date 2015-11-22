class AddBankInfoToAccount < ActiveRecord::Migration
  def change
  	add_column :accounts, :bank_state, :string
  	add_column :accounts, :bank_country, :string
  	add_column :accounts, :bank_zip_code, :integer
  	add_column :accounts, :bank_primary_phone, :string
  	add_column :accounts, :bank_secondary_phone, :string
  	add_column :accounts, :account_holder_type, :integer
  end
end
