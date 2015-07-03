class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
    if current_user
      @review = @product.reviews.build
    end
  end

  def new
    @meal = Meal.new
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user_id = current_user.id

    if @meal.save
      redirect_to meals_url
    else
      render :new
    end
  end

  def update
    @meal = Meal.find(params[:id])

    if @meal.update_attributes(meal_params)
      redirect_to meal_path(@meal)
    else
      render :edit
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to meals_path
  end

  private
  def meal_params
    params.require(:meal).permit(:name, :description, :price_in_cents, :user_id)
  end
end