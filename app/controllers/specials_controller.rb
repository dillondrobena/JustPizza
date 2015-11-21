class SpecialsController < ApplicationController
  before_filter 'find_special', only: [:show, :edit, :update, :destroy]
  before_filter :check_admin

  def index
    @specials = Special.all
  end

  def show
  end

  def edit
  end

  def update
    @special = Special.find(params[:id])
    if @special.update_attributes(special_params)
      redirect_to @special
    else
      render 'edit'
    end
  end

  private

  def find_special
    @special = Special.find(params[:id])
  end

  def special_params
    params.require(:special).permit(:cost, :pizza_attributes => [:name, :crust_id, :topping_ids => []])
  end
end
