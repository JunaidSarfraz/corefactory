class ContractPayrollsPayHead < ActiveRecord::Base
	belongs_to	:contract_payroll
	belongs_to	:pay_head
end
