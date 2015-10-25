class RenameContractIdToBranchIdInPayHead < ActiveRecord::Migration
  def change
  	rename_column :pay_heads, :contract_id, :branch_id
  end
end
