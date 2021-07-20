# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
User.destroy_all
item_categories = ["Main", "Topping", "Side", "Drink"]

item_categories.each do |category|
    Category.create(name: category)
    puts "created #{category} category"
end

admin = User.create!(first_name: "Ben", last_name: "Elsom", email:"admin@kon.com", phone_number: "0408285128", password: "123456", password_confirmation: "123456")
puts "Created admin account"