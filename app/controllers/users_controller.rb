class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @meals = Meal.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to meals_url, notice: "Signed up!"
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:firstName, :lastName, :companyName, :specialties, :email, :password, :password_confirmation)
  end
end