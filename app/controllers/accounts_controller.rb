class AccountsController < ApplicationController
	def index
		load_account_holders
	end

	def new
		@account = Account.new
	end

	def create
	end

	private

	def load_account_holders
		@account_holders = Array.new
		current_user.companies.each do |company|
			company.branches.each do |branch|
				@account_holders = @account_holders + branch.employees
			end
		end
	end
end
