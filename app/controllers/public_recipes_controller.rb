class PublicRecipesController < ApplicationController
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.includes(:user).where(public: true)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.includes(:user).find(params[:id])
    redirect_to public_recipes_path, alert: 'This recipe is not public.' unless @recipe.public
  end
end
