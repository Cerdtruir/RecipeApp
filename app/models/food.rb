class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :delete_all

  def calculate_total_price(food, current_user)
    total_quantity = 0
    food.recipe_foods.each do |recipe_food|
      total_quantity += recipe_food.quantity if recipe_food.recipe.user_id == current_user.id
    end
    total_quantity * food.price
  end
end
