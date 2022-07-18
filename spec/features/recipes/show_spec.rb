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
end

