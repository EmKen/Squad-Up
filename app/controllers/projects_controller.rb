class ProjectsController < ApplicationController
	def create
		@project = current_user.managed_projects.new(project_params)
		@project.skills = Skill.where(id: params[:project][:skills])
		if current_user.manager?
			@project.approved!
		end
		if @project.save
			redirect_to "/"
		else
			byebug
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	def approve
		@project = Project.find(params[:id])
		@project.approved!
		@project.approved_or_refused_by = current_user
		if @project.save
			redirect_to "/"
		end
	end

	def refuse
		@project = Project.find(params[:id])
		@project.refused!
		@project.approved_or_refused_by = current_user
		if @project.save
			redirect_to "/"
		end
	end

	def build_squad
		@project = Project.find(params[:id])
	end

	def team_members
		@project = Project.find(params[:id])
		@project.skills.ids.each do |skill_id|
			project_skill_id = ProjectSkill.find_by(skill_id: skill_id, project_id: @project.id).id
			if params["#{skill_id}"]
				params["#{skill_id}"].each do |user_id|
					team_member = ProjectTeamMember.create(project_id: @project.id, user_id: user_id, project_skill_id: project_skill_id)
				end
			end
		end
		redirect_to @project
	end

	private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
