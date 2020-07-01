require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create(email: 'admin@example.com', name: 'Desafío', lastname: 'Latam', nickname: 'dl', password: 123_456)

10.times do
  name = Faker::Name.first_name
  lastname = Faker::Name.last_name
  nickname = "#{name.downcase}_#{lastname.downcase}"

  User.create(email: Faker::Internet.unique.email, name: name, lastname: lastname, nickname: nickname, password: 123_456)
end
