# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

puts 'Cleaning database...'
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

response = RestClient.get "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
repos = JSON.parse(response)

puts 'Creating 270 fake cocktails, ingredients, doses ...'
repos["drinks"].each do |ing|
  ingredient = Ingredient.create!(name: ing["strIngredient1"])
  cocktail = Cocktail.create!(name:    Faker::Address.city)
  Dose.create!(description: "#{(1..10).to_a.sample}cl", ingredient: ingredient, cocktail: cocktail)
end
#270
puts 'Finished!'
