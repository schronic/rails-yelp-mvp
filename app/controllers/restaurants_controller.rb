class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :destroy, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = Review.all.where(restaurant_id: params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_params)

    if @restaurant.valid?
      @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @restaurant.update(strong_params)
    redirect_to restaurants_path
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def strong_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
