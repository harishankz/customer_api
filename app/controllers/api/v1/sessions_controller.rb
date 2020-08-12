class Api::V1::SessionsController < Devise::SessionsController

  def create
    user = User.find_by_email(params[:email])

    if user && user.valid_password?(params[:password])
      user.generate_jwt
      render json: {
          status: :created,
          logged_in: true,
          user: user
      }
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
end