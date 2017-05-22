class ApplicationController < ActionController::Base
	include Clearance::Controller
	protect_from_forgery with: :exception

	def require_login
		unless signed_in?
			flash.now[:danger] = "Please sign in to continue."
			deny_access()
		end
	end
end
