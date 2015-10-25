class PayrollSchedule < ActiveRecord::Base
	belongs_to	:payroll
	has_many	:transections
end
