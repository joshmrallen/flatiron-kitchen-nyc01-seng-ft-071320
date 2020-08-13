class RecipesController < ApplicationController
    # show, new, create, edit, update
    before_action :find_recipe, only: [:show, :edit, :update]

    def index
        @recipes = Recipe.all
    end

    def show
        find_recipe
    end

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
    end

    def create
        @recipe = Recipe.create(recipe_params)
        redirect_to recipe_path(@recipe)
    end

    def edit
        find_recipe
    end

    def update
        find_recipe
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes:[:name])
    end

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

end
