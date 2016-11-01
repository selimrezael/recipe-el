class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all.order("Created_at DESC")
  end

  def show
  end

  def new
  	@recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(recipe_params)

  	if @recipe.save
  	  redirect_to @recipe, notice: "Successfully created new recipe."
  	else
  	  render 'new'
  	end
  end

  private

  def find_recipe
  	@recipe = Recipe.find(params[:id])
  end

  def recipe_params
  	params.require(:recipe).permit(:title, :description)
  end
end
