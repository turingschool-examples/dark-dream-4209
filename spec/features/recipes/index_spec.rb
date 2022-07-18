require 'rails_helper'

RSpec.describe 'recipes index page ' do
    it 'has the name, complexity, and genre of each recipe' do
        enchiladas = Recipe.create!(name: "Enchiladas", complexity: 4, genre: "Mexican")
        tortas = Recipe.create!(name: "Tortas", complexity: 3, genre: "Mexican")
        spagetti = Recipe.create!(name: "Spagetti", complexity: 2, genre: "Italian")

        visit '/recipes'

        within "#recipes-#{enchiladas.id}" do
            expect(page).to have_content("Dish: Enchiladas")
            expect(page).to have_content("Complexity: 4")
            expect(page).to have_content("Genre: Mexican")
        end
       
        within "#recipes-#{tortas.id}" do
            expect(page).to have_content("Dish: Tortas")
            expect(page).to have_content("Complexity: 3")
            expect(page).to have_content("Genre: Mexican")
        end
       
        within "#recipes-#{spagetti.id}" do
            expect(page).to have_content("Dish: Spagetti")
            expect(page).to have_content("Complexity: 2")
            expect(page).to have_content("Genre: Italian")
        end
    end
end
