class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)

    return render json: @user.errors, status: :unprocessable_entity unless @user.save

    render json: @user, status: :created
  end

  def show
    @bookings = Booking.where(user_id: params[:id])

    render json: @bookings
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
