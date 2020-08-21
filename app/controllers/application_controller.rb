class ApplicationController < ActionController::API

  before_action :authorized

  # Encode our payload (which will be the user_id)
  # using the JWT_SECRET key we've hidden as an
  # environment variable
  def encode_token(payload)
    token = JWT.encode(payload, ENV["JWT_SECRET"])
  end

  # Grab just the 'Authorization' key from
  # the request's headers
  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      # The value of the auth_header should look
      # something like: "Bearer <token>".
      # So, grab the <token> from that string
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, ENV["JWT_SECRET"], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        # If there's an error, return nil so the application
        # doesn't crash and instead would send a message
        # of "Please log in" (see #authorized below)
        nil
      end
    end
  end

  # If the token has been decoded successfully, set the @user variable
  # to the current user. If the token is decoded unsuccessfully, the
  # return value of #current_user is nil, and thus #logged_in? returns false
  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  # Unless a valid login has occurred, send a reponse informing the
  # user that login is required
  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

end
