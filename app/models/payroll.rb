class Payroll < ActiveRecord::Base
	enum _type: [:monthly, :weekly, :daily, :contract, :hourly]
end
