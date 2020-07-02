class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.valid?
      binding.pry
      render json: user
    else
      render json: { error: user.errors.full_messages[0] }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
