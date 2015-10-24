class Transection < ActiveRecord::Base
	enum payment_type: [:cash, :cheque]
end