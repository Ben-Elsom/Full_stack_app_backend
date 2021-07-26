Category.destroy_all
User.destroy_all
MenuItem.destroy_all
item_categories = ["Main", "Topping", "Side", "Drink"]


main = Category.create!(name: "Main")
topping = Category.create!(name: "Topping")
side = Category.create!(name: "Side")
drink = Category.create!(name: "Drink")

admin = User.create!(first_name: "Ben", last_name: "Elsom", email:"admin@kon.com", phone_number: "0408285128", password: "123456", password_confirmation: "123456", isAdmin: true )

MenuItem.create!(user_id: admin.id, name: "Beef ramen", available: true, description: "Beef ramen with spring onion and wheat noodles", price: 9.90, category: main).thumbnail.attach(io: File.open(Rails.root.to_s + "/app/assets/beef_ramen.jpg"), filename: "beef_ramen.jpg", content_type: 'application/jpg')
MenuItem.create!(user_id: admin.id, name: "Pork ramen", available: true, description: "Pork ramen with spring onion and wheat noodles", price: 9.90, category: main).thumbnail.attach(io: File.open(Rails.root.to_s + "/app/assets/pork_ramen.jpg"), filename: "pork_ramen.jpg", content_type: 'application/jpg')
MenuItem.create!(user_id: admin.id, name: "Egg", available: true, description: "Fresh free range egg", price: 3.90, category: topping).thumbnail.attach(io: File.open(Rails.root.to_s + "/app/assets/egg.jpg"), filename: "egg.jpg", content_type: 'application/jpg')
MenuItem.create!(user_id: admin.id, name: "Extra noodles", available: true, description: "An extra cup of wheat noodles", price: 1, category: topping).thumbnail.attach(io: File.open(Rails.root.to_s + "/app/assets/extra_noodles.jpg"), filename: "extra_noodles.jpg", content_type: 'application/jpg')
MenuItem.create!(user_id: admin.id, name: "Gyoza", available: true, description: "Fresh pork gyoza", price: 3.90, category: side).thumbnail.attach(io: File.open(Rails.root.to_s + "/app/assets/gyoza.jpg"), filename: "gyoza.jpg", content_type: 'application/jpg')
MenuItem.create!(user_id: admin.id, name: "Spring roll", available: true, description: "Vegetable spring roll ", price: 3.90, category: side).thumbnail.attach(io: File.open(Rails.root.to_s + "/app/assets/spring_roll.jpg"), filename: "spring_roll.jpg", content_type: 'application/jpg')
MenuItem.create!(user_id: admin.id, name: "Coke", available: true, description: "600ml Coca cola", price: 3.90, category: drink).thumbnail.attach(io: File.open(Rails.root.to_s + "/app/assets/coke.jpg"), filename: "coke.jpg", content_type: 'application/jpg')
MenuItem.create!(user_id: admin.id, name: "Pepsi", available: false, description: "600ml Pepsi", price: 3.90, category: drink).thumbnail.attach(io: File.open(Rails.root.to_s + "/app/assets/pepsi.jpg"), filename: "pepsi.jpg", content_type: 'application/jpg')

