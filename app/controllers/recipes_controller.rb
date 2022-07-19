class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]
  before_action :authenticate_user!

  # GET /recipes or /recipes.json
  def index
    @user = current_user
    @recipes = Recipe.where(user_id: @user.id)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @user = current_user
    redirect_to recipes_path, alert: 'You are not authorized to view this recipe.' if @recipe.user_id != @user.id
    @ingredients = RecipeFood.where(recipe_id: @recipe.id)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description,
                                   :public).merge(user_id: current_user.id)
  end
end
