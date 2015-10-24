class Account < ActiveRecord::Base

	enum _type: [:bank_account, :company_account, :worker_account, :client_account]
end
