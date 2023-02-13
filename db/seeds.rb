# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
City.destroy_all
Gossip.destroy_all
GossipTag.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all
RecipientList.destroy_all

require 'faker'

nb_user = 10
nb_city = 10
nb_gossip = 20
nb_tags = 10
nb_messages = 20
users = []
cities = []
gossips = []
tags = []
messages = []


nb_city.times do |x|
	city = City.create(
		name: Faker::Address.city,
		zip_code: Faker::Address.zip_code)
	cities << city
 	puts "Création de la Ville n°#{x}"
end

nb_user.times do |x|
	user = User.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		description: Faker::Lorem.paragraph,
		email: Faker::Internet.email,
		age: rand(13..110),
		city_id: cities[rand(0..nb_city-1)].id)
	users << user
 	puts "Création de l'utilisateur n°#{x}"
end

nb_gossip.times do |x|
	gossip = Gossip.create(
			title: Faker::Book.title,
			content: Faker::Lorem.paragraph,
			user_id: users[rand(0..nb_user-1)].id)
	gossips << gossip
 	puts "Création du potin n°#{x}"
end

nb_tags.times do |x|
	tag = Tag.create(
		title: Faker::Book.genre)
	tags << tag
 	puts "Création du tag n°#{x}"
end

nb_gossip.times do |x|
	GossipTag.create(
			gossip_id: gossips[rand(0..nb_gossip-1)].id,
			tag_id: tags[rand(0..nb_tags-1)].id)
	puts "Création d'un tag par gossip n°#{x}"
end

40.times do |x|
	GossipTag.create(
			gossip_id: gossips[rand(0..nb_gossip-1)].id,
			tag_id: tags[rand(0..nb_tags-1)].id)
	puts "Création de tag supplémentaire par gossip n°#{x}"
end

nb_messages.times do |x|
	message = PrivateMessage.create(
		sender_id: users[rand(0..nb_user-1)].id,
		content: Faker::Lorem.paragraph)
	messages << message
	puts "Création du message privé n°#{x}"
end

nb_messages.times do |x|
	message = RecipientList.create(
		private_message_id: messages[x].id,
		recipient_id: users[rand(0..nb_user-1)].id)
	messages << message
	puts "Création du réceptionniste du message privé n°#{x}"
end

nb_messages.times do |x|
	message = RecipientList.create(
		private_message_id: messages[rand(0..nb_messages-1)].id,
		recipient_id: users[rand(0..nb_user-1)].id)
	messages << message
	puts "Création des messages avec plusieurs réceptionnistes n°#{x}"
end

