# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

50.times do
	List.create(
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph
		)
end
lists = List.all

100.times do
	Todo.create(
		list: lists.sample,
		body:Faker::Lorem.paragraph
		)
end

puts "seed done!"
puts "#{List.count} lists created"
puts "#{Todo.count} todos created"