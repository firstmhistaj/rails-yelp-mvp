class ReviewsController < ApplicationController
  def index
    # Logic to retrieve all reviews
    @reviews = Review.all
  end

  def show
    # Logic to retrieve a specific review
    @review = Review.find(params[:id])
  end

  def new
    # Logic to create a new review
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # Logic to create a new review based on the submitted form data
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.review.new(review_params)

    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
