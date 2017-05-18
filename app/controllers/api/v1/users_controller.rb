class Api::V1::UsersController < Api::V1::ApplicationController
	def show
		user = User.find(params[:id])
		render json:user
	end

	def index
		render json:User.all
	end	

	def update
		current_params = params.dup
		current_params.delete("private_token")
		current_user.update(current_params)
	end

	def give_current_user
		skills = current_user.skills
		own_project = current_user.managed_projects
		# own_project_skills = ProjectTeamMember.find_by(project_id:own_project.id,user_id:current_user
		joined_project = current_user.projects - own_project
		render json:[current_user,skills,own_project,joined_project]
	end

end
