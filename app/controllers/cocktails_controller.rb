class CocktailsController < ApplicationController


  # def self.search(term)
  #   if term
  #     where('name LIKE ?', "%#{term}%")
  #   else
  #     all
  #   end
  # end


  def index
    # @cocktails = Cocktail.all
     # @cocktails = Cocktail.search(params[:term])
    @cocktails = if params[:term]
      Cocktail.where('name ILIKE ?', "%#{params[:term]}%").all
    else
      Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :term)
  end

end
