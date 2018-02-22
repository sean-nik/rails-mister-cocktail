# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
drinks_hash = JSON.parse(drinks_serialized)

drinks_hash["drinks"].each do |drink|
  Ingredient.create(name: drink["strIngredient1"])
end

Cocktail.create(name: "Mojito")
Cocktail.create(name: "Cuba Libre")
Cocktail.create(name: "Gin Tonic")

Dose.create(description: '1 serving', cocktail_id: 1, ingredient_id: 1)
