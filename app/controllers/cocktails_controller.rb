class CocktailsController < ApplicationController
    before_action :set_cocktail, only: [ :show, :edit, :update, :destroy ]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail= Cocktail.new
  end

  def create
    @cocktail= Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit
    @cocktail.save
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end
end
