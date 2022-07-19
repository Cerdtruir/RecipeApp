class RecipeFoodsController < ApplicationController
  # GET /recipe_foods/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  # GET /recipe_foods/1/edit
  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_url(@recipe), notice: 'Recipe food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_url(@recipe), notice: 'Recipe food was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_recipe_foods_url, notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id).merge(recipe_id: params[:recipe_id])
  end
end
