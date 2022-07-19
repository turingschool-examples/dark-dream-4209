
# User Story 1 of 4
# As a visitor,
# When I visit '/recipes',
# I see a list of recipes with the following information:
# -Name
# -Complexity
# -Genre
# (e.g. "Name: Spaghetti, Complexity: 2, Genre: Italian")

require 'rails_helper'

RSpec.describe 'recipes index page' do
  it 'shows the name of all recipes and info (Name, Complexity, Genre)' do
    spaghetti = Recipe.create!(Name: "Spaghetti", Complexity: 2, Genre: "Italian")
    chili = Recipe.create!(Name: "Chili", Complexity: 3, Genre: "Texan")
    hummus = Recipe.create!(Name: "Hummus", Complexity: 1, Genre: "Med")

    visit "/recipes"
    # within "#courses-#{spaghetti.id}" do
    expect(page).to have_content("Spaghetti")
    expect(page).to have_content("Chili")
    expect(page).to have_content("Hummus")
    expect(page).to have_content(1)
    expect(page).to have_content(2)
    expect(page).to have_content(3)
    expect(page).to have_content("Italian")
    expect(page).to have_content("Texan")
    expect(page).to have_content("Med")
  end
end
