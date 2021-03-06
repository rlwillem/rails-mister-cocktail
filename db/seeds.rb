require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
puts 'adding ingredients, brewing cocktails'
ingredients = JSON.parse(ingredients_serialized)
ingredients["drinks"].each do |ingredient|
  cocktail_ingredient = Ingredient.new(name: ingredient["strIngredient1"])
  cocktail_ingredient.save
end


puts 'Finished!'
