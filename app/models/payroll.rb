class Payroll < ActiveRecord::Base
	enum _type: [:monthly, :weekly, :daily, :contract, :hourly]
	belongs_to	:user
	has_many	:payroll_schedules
	has_many	:contract_payrolls
end
