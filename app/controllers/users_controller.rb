class UsersController < Clearance::UsersController
	before_action :require_login
	def show
		@user = User.find(params[:id])
		@project = Project.new
	end
end
