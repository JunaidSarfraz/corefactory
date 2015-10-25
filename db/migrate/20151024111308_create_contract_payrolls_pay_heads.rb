class CreateContractPayrollsPayHeads < ActiveRecord::Migration
  def change
    create_table :contract_payrolls_pay_heads do |t|
    	t.integer	:pay_head_id
    	t.integer	:contract_payroll_id

    	#two more columns are added in this table in next migration
    	#the coulmns are
    	# 1. pay
    	# 2. number of Items
    	# the purpose of these attributes are to store employee specific pay information
    	
      t.timestamps null: false
    end
  end
end
