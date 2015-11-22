class Account < ActiveRecord::Base
	enum _type: [:bank_account, :company_account]
	enum account_holder_type: [:employee, :client, :supplier, :company]

	belongs_to :user
	belongs_to :company
	has_many :withdrawl_transections, :class_name => "Transection", :foreign_key => "withdrawn_account_id", :dependent => :delete_all
	has_many :deposited_transections, :class_name => "Transection", :foreign_key => "submitted_account_id", :dependent => :delete_all		
end
