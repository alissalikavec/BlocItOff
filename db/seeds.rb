require 'faker'

100.times do
	Todo.create(
		description: Faker::Lorem.sentence,
		completed: false
		)
end
todos = Todo.all

puts "seed done!"
puts "#{Todo.count} todos created"