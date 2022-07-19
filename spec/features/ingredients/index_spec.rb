require 'rails_helper'

RSpec.describe 'ingredients index page (all ingredients)' do
    it 'has a list of names of ingredients and number of recipes with ingredients' do
        tortas = Recipe.create!(name: "Tortas", complexity: 3, genre: "Mexican")
        spagetti = Recipe.create!(name: "Spagetti", complexity: 2, genre: "Italian")

        noodles = Ingredient.create!(name: "Spagetti Noodles", cost: 2)
        tomatoe = Ingredient.create!(name: "Tomatoes", cost: 1)
        asada = Ingredient.create!(name: "Carne Asada", cost: 3)
        
        torta_ingredient_1 = RecipeIngredient.create!(recipe_id: tortas.id, ingredient_id: asada.id)
        torta_ingredient_2 = RecipeIngredient.create!(recipe_id: tortas.id, ingredient_id: tomatoe.id)
        spagetti_ingredient_1 =RecipeIngredient.create!(recipe_id: spagetti.id, ingredient_id: tomatoe.id)
        spagetti_ingredient_2 =RecipeIngredient.create!(recipe_id: spagetti.id, ingredient_id: noodles.id)

        visit "/ingredients"

        within "#ingredients-#{noodles.id}" do
        expect(page).to have_content("Spagetti Noodles: 1")
        end

        within "#recipes-#{tomatoe.id}" do
            expect(page).to have_content("Tomatoes: 2")
        end

        within "#recipes-#{asada.id}" do
            expect(page).to have_content("Carne Asada : 1")
        end
    end
end

