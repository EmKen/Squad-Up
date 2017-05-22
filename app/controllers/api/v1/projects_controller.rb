class Api::V1::ProjectsController < Api::V1::ApplicationController
	def show
		project = Project.find(params[:project_id].to_i)
		project_team_members = project.users
		project_owner = project.project_owner
		project_team_members = [project_owner] + project_team_members
		render json:project_team_members
	end
end