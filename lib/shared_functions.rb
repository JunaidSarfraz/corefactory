def load_workers
	@workers = Array.new
	current_user.companies.each do |company|
		company.branches.each do |branch|
			@workers = @workers + branch.employees
		end
	end
end