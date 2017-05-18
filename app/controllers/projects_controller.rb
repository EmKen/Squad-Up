class ProjectsController < ApplicationController
	def create
		@project = current_user.managed_projects.new(project_params)
		@project.skills = Skill.where(id: params[:project][:skills])
	end

	private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
