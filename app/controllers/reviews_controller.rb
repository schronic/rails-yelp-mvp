class ReviewsController < ApplicationController
    def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = params[:restaurant_id]

    if @review.valid?
      @review.restaurant = Restaurant.find(params[:restaurant_id])
      @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end
end
