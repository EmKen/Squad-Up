class Api::V1::SessionsController < Api::V1::ApplicationController
	skip_before_action :check_authorization
  def create
    email, password = params.values_at("email", "password")
    user = User.find_by(email:email)
  	result = !user.nil? && user.authenticated?(password)
  	if result
      render json: {private_token: user.private_token}
  	else
      render status: 403, json: {error: "Wrong email or password"}
    end
  end

  # private
  # def session_params
  # 	params.permit(:email,:password, :session)
  # end
end
