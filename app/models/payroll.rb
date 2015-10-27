class Payroll < ActiveRecord::Base
	enum _type: [:monthly, :weekly, :daily, :contract, :hourly]
	belongs_to	:user
	has_many	:payroll_schedules, :dependent => :delete_all
	has_many	:contract_payrolls, :dependent => :delete_all
end
