# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tortas = Recipe.create!(name: "Tortas", complexity: 3, genre: "Mexican")

asada = Ingredient.create!(name: "Carne Asada", cost: 3)
tomatoe = Ingredient.create!(name: "Tomatoes", cost: 2)
lettuce = Ingredient.create!(name: "Letuce", cost: 1)
frijol = Ingredient.create!(name: "Frijol", cost: 1)
aguacate = Ingredient.create!(name: "Agucate", cost: 4)

torta_ingredient_1 = RecipeIngredient.create!(recipe_id: tortas.id, ingredient_id: asada.id)
torta_ingredient_2 = RecipeIngredient.create!(recipe_id: tortas.id, ingredient_id: tomatoe.id)
torta_ingredient_3 = RecipeIngredient.create!(recipe_id: tortas.id, ingredient_id: lettuce.id)
torta_ingredient_4 = RecipeIngredient.create!(recipe_id: tortas.id, ingredient_id: frijol.id)
torta_ingredient_5 = RecipeIngredient.create!(recipe_id: tortas.id, ingredient_id: aguacate.id)
