class Transection < ActiveRecord::Base
	enum payment_type: [:cash, :cheque]
	belongs_to :withdrawn_account, :class_name => "Account", :foreign_key => "withdrawn_account_id"
	belongs_to :deposited_account, :class_name => "Account", :foreign_key => "submitted_account_id"
	belongs_to :payroll_schedule
end