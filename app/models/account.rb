class Account < ActiveRecord::Base
	enum _type: [:bank_account, :company_account]

	belongs_to :user
	has_many :withdrawl_transections, :class_name => "Transection", :foreign_key => "withdrawn_account_id", :dependent => :delete_all
	has_many :deposited_transections, :class_name => "Transection", :foreign_key => "submitted_account_id", :dependent => :delete_all		
end
