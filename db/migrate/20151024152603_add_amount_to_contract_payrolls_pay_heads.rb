class AddAmountToContractPayrollsPayHeads < ActiveRecord::Migration
  def change
  	add_column :contract_payrolls_pay_heads, :pay, :integer
  	add_column :contract_payrolls_pay_heads, :number_of_item, :integer
  end
end
