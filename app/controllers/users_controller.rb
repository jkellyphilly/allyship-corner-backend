class UsersController < ApplicationController

  skip_before_action :authorized, only: [:create, :index]

  def index
    users = User.all
    render json: UserSerializer.new(users)
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token(user_id: user.id)
      render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    else
      render json: { message: user.errors.full_messages[0] }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
