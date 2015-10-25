class ContractPayroll < ActiveRecord::Base
	enum _type: [:fixed_contract, :heads_wise_contract]
	belongs_to	:payroll
	
	#Many to many relationship of payheads and contract payroll
	#---------------------------------------------------------------------------------
	has_many	:contract_payrolls_pay_heads
	has_many	:pay_heads, through: :contract_payrolls_pay_heads
	#---------------------------------------------------------------------------------
end
