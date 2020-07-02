class UsersController < ApplicationController

  def create
    binding.pry
    user = User.create(user_params)
    binding.pry
    if user.valid?
      render json: user
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
