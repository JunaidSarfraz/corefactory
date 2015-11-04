def load_workers
	puts "-=-=-=-=-=-=-=-=-=-=-=-\n" * 10
	puts "workers are loading"
	puts "-=-=-=-=-=-=-=-=-=-=-=-\n" * 10
	@workers = Array.new
	current_user.factories.each do |factory|
		factory.branches.each do |branch|
			@workers = @workers + branch.employees
		end
	end
end