class Account < ActiveRecord::Base
	enum _type: [:bank_account, :company_account, :worker_account, :client_account]

	belongs_to :user
	has_many :withdrawl_transections, :class_name => "Transection", :foreign_key => "withdrawn_account_id"
	has_many :deposited_transections, :class_name => "Transection", :foreign_key => "submitted_account_id"		
end
