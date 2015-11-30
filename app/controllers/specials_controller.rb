class SpecialsController < ApplicationController
  before_filter 'find_special', only: [:show, :edit, :update, :destroy]
  before_filter 'get_images', only: [:new, :edit]
  before_filter :check_admin

  def index
    @specials = Special.all
  end

  def new
    @special = Special.new
  end

  def create
    @special = Special.create(special_params)
    if @special.save
      redirect_to @special
    else
      render 'new'
    end
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

  def get_images
    @images = Dir.glob("app/assets/images/*").collect {|img| File.basename(img)}
  end

  def find_special
    @special = Special.find(params[:id])
  end

  def special_params
    params.require(:special).permit(:cost, :enabled, :pizza_path, :pizza_attributes => [:name, :crust_id, :topping_ids => []])
  end
end
