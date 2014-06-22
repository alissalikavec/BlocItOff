namespace :todo do
desc 'Removes todos that are 7 days old'
	task :delete_items => :environment do
		Todo.where("created_at <= ?", Time.now - 1.hour).destroy_all
	end
end