class PublicRecipesController < ApplicationController
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    redirect_to public_recipes_path, alert: 'This recipe is not public.' unless @recipe.public
  end
end
