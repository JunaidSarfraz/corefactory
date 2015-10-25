class AddBranchHeadIdInBranch < ActiveRecord::Migration
  def change
  	add_column :branches, :branch_head_id, :integer
  end
end
