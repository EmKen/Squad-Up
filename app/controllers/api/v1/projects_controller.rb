class Api::V1::ProjectsController < Api::V1::ApplicationController
	def show
		project = Project.find(params[:project_id].to_i)
		project_team_members = project.users
		project_owner = project.project_owner
		project_team_members = [project_owner] + project_team_members
		project_team_members_arr = []
		project_team_members.each do |user|
			u = user.attributes
			u["profile_picture"] = {"url":user.profile_picture.url}
			project_team_members_arr << u
		end
		render json:project_team_members_arr
	end
end