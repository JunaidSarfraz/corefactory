class RenameFactoriesToCompanies < ActiveRecord::Migration
  def change
 	rename_table :factories, :companies
 	rename_column :branches, :factory_id, :company_id
 	rename_column :companies, :password_of_factory_email, :password_of_company_email
  end
end
