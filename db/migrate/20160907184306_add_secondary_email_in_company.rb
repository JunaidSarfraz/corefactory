class AddSecondaryEmailInCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :secondary_email, :string
  end
end
