class PayHead < ActiveRecord::Base
	belongs_to	:branch
	has_many 	:work_diaries, :dependent => :delete_all
	#Many to many relationship of payheads and contract payroll
	#---------------------------------------------------------------------------------
	has_many	:contract_payrolls_pay_heads, :dependent => :delete_all
	has_many	:contract_payrolls, through: :contract_payrolls_pay_heads, :dependent => :delete_all
	#---------------------------------------------------------------------------------
end
