class ProjectsController < ApplicationController
	def create
		@project = current_user.managed_projects.new(project_params)
		@project.skills = Skill.where(id: params[:project][:skills])
		if current_user.manager?
			@project.approved!
		end
		if @project.save
			redirect_to "/"
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	def approve
		@project = Project.find(params[:id])
		@project.approved!
		redirect_to "/"
	end

	def refuse
		@project = Project.find(params[:id])
		@project.refused!
		redirect_to "/"
	end

	def build_squad
		@project = Project.find(params[:id])
	end

	def team_members
		@project = Project.find(params[:id])
		redirect_to @project
	end

	private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
