class ToppingsController < ApplicationController
  before_filter 'find_topping', only: [:show, :edit, :update, :destroy]
  before_filter :check_admin
  def index
    @toppings = Topping.all
  end

  def new
    @topping = Topping.new
  end

  def create
    @topping = Topping.create(topping_params)
    if @topping.save
      redirect_to @topping
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @topping.update(topping_params)
      redirect_to @topping
    else
      render 'edit'
    end
  end

  def destroy
    render 'index'
  end

  private

  def find_topping
    @topping = Topping.find(params[:id])
  end

  def topping_params
    params.require(:topping).permit(:name, :cost)
  end
end
