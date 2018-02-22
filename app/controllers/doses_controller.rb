class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :destroy]
  def new
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def create
    @dose = Dose.new
    @dose.cocktail = @cocktail
    ingredient = Ingredient.find(dose_params[:ingredient_id])
    @dose.ingredient = ingredient
    @dose.description = dose_params[:description]
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
