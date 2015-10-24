class CreateContractPayrolls < ActiveRecord::Migration
  def change
    create_table :contract_payrolls do |t|
    	t.date		:contract_start_date
    	t.text		:description
    	t.integer	:_type
    	t.date 		:fixed_contract_end_date
    	t.integer 	:fixed_contract_amount_to_be_paid
    	t.integer	:payroll_id

      t.timestamps null: false
    end
  end
end
