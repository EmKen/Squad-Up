class SessionsController < Clearance::SessionsController
	def url_after_create
    user_path(current_user)
  end


end
