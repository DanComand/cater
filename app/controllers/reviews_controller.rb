class ReviewsController < ApplicationController
	 before_filter :load_meal

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @meal.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to :back, notice: 'Review created successfully'

    else
      render 'meals/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :rating, :meal_id)
  end

  def load_meal
    @meal = Meal.find(params[:meal_id])
  end
end