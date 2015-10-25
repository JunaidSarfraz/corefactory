class PayHead < ActiveRecord::Base
	belongs_to	:branch
	has_many 	:work_diaries
	#Many to many relationship of payheads and contract payroll
	#---------------------------------------------------------------------------------
	has_many	:contract_payrolls_pay_heads
	has_many	:contract_payrolls, through: :contract_payrolls_pay_heads
	#---------------------------------------------------------------------------------
end
