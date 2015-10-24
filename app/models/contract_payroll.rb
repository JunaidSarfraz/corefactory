class ContractPayroll < ActiveRecord::Base
	enum _type: [:fixed_contract, :heads_wise_contract]
end
