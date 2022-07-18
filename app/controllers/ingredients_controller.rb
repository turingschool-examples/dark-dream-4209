class IngredientsController < ActionController::Base
   
    def index
        @ingredients = Ingredient.all
    end

end
