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
  end
end
