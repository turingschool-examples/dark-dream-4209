require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'ingredient methods' do
    it 'displays how many recipes have this ingredient with method recipe_count' do
      enchiladas = Recipe.create!(name: "Enchiladas", complexity: 4, genre: "Mexican")
      tortas = Recipe.create!(name: "Tortas", complexity: 3, genre: "Mexican")
      spagetti = Recipe.create!(name: "Spagetti", complexity: 2, genre: "Italian")

      tomatoe = Ingredient.create!(name: "Tomatoes", cost: 1)


      torta_ingredient_2 = RecipeIngredient.create!(recipe_id: tortas.id, ingredient_id: tomatoe.id)
      spagetti_ingredient_1 =RecipeIngredient.create!(recipe_id: spagetti.id, ingredient_id: tomatoe.id)
    
      expect(tomatoe.recipe_count).to eq(2)
    end
    it ' can show total cost of ingredients' do
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

    expect(Ingredient.total_cost).to eq(11)
    end
  end
end
