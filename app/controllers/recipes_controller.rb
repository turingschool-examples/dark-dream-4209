class RecipesController < ActionController::Base
    def index
        @recipes = Recipe.all
    end
end
