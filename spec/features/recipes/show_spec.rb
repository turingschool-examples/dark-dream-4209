require 'rails_helper'

RSpec.describe 'recipes show page (with ingredients)' do
    it 'has a list of names of ingredients' do
        tortas = Recipe.create!(name: "Tortas", complexity: 3, genre: "Mexican")
        spagetti = Recipe.create!(name: "Spagetti", complexity: 2, genre: "Italian")

        noodles = Ingredient.create!(name: "Spagetti Noodles", cost: 2)
        tomatoe = Ingredient.create!(name: "Tomatoes", cost: 1)
        asada = Ingredient.create!(name: "Carne Asada", cost: 3)

        torta_ingredient_1 = RecipeIngredient.create!(recipe_id: tortas.id, ingredient_id: asada.id)
        torta_ingredient_2 = RecipeIngredient.create!(recipe_id: tortas.id, ingredient_id: tomatoe.id)
        spagetti_ingredient_1 =RecipeIngredient.create!(recipe_id: spagetti.id, ingredient_id: tomatoe.id)
        spagetti_ingredient_2 =RecipeIngredient.create!(recipe_id: spagetti.id, ingredient_id: noodles.id)

        visit "recipes/#{tortas.id}"

        expect(page).to have_content("Carne Asada")
        expect(page).to have_content("Tomatoes")
        expect(page).to_not have_content("Spagetti Noodles")
    end

    it 'shows total cost of ingredient for a recipe' do
        tortas = Recipe.create!(name: "Tortas", complexity: 3, genre: "Mexican")
        enchiladas = Recipe.create!(name: "Enchiladas", complexity: 4, genre: "Mexican")
        spagetti = Recipe.create!(name: "Spagetti", complexity: 2, genre: "Italian")

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
    
    
        visit "recipes/#{tortas.id}"

        expect(page).to have_content("Total Cost: 11")
    
    end
end

# User Story 4 of 4
# As a visitor,
# When I visit '/recipes/:id'
# I see the total cost of all of the ingredients in the recipe.
# (e.g. "Total Cost: 22")