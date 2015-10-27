class PayrollSchedule < ActiveRecord::Base
	belongs_to	:payroll
	has_many	:transections, :dependent => :delete_all
end
