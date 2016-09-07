class RenameCountryColumnBranches < ActiveRecord::Migration
  def change
  	rename_column :branches, :country, :state
  end
end
