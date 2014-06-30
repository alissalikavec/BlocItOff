namespace :todo do
desc 'Removes todos that are 1 hour old'
	task delete_items: :environment do
		Todo.where("created_at <= ?", Time.now - 7.days).destroy_all
	end
end