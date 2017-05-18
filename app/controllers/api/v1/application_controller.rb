class Api::V1::ApplicationController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :check_authorization

	def check_authorization
		return not_authorized_message if params["private_token"].nil?
		user = User.find_by(private_token: params["private_token"])
		return not_authorized_message if user.nil?
		@current_user = user
	end

	def not_authorized_message
    render status: 403, json: {message: "No valid private token in request"}
  end

  def current_user
    @current_user
  end
end 