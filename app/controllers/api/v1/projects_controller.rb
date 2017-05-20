class Api::V1::ProjectsController < Api::V1::ApplicationController
	def show
		project_team_members = Project.find(params[:project_id].to_i).users
		project_team_owner = Project.find(params[:project_id].to_i).project_owner
		ind = project_team_members.index(project_team_owner)
		if ind != 0
			user = project_team_members[0]
			project_team_members[0] = project_team_owner
			project_team_members[ind] = user
		end
		render json:project_team_members
	end
end