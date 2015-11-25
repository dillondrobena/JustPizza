class CrustsController < ApplicationController
  before_filter 'find_crusts', only: [:show, :edit, :update, :destroy]
  before_filter :check_admin

  def index
    @crusts = Crust.all
  end

  def new
    @crust = Crust.new
  end

  def create
    @crust = Crust.create(crust_params)
    if @crust.save
      redirect_to @crust
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @crust.update(crust_params)
      redirect_to @crust
    else
      render 'edit'
    end
  end

  def show

  end

  private

  def find_crusts
    @crust = Crust.find(params[:id])
  end

  def crust_params
    params.require(:crust).permit(:name, :enabled)
  end
end
