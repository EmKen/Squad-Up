class ProjectsController < ApplicationController
	before_action :require_login

	def create
		@project = current_user.managed_projects.new(project_params)
		@project.skills = Skill.where(id: params[:project][:skills])
		if !current_user.staff?
			@project.approved!
			@project.approved_or_refused_by = current_user
			if @project.save
				redirect_to build_squad_path(@project)
			end
		else
			name = "#{current_user.first_name} #{current_user.last_name}"
			company = current_user.company
			if @project.save
				managers = company.users.where(department:current_user.department)
				if managers.exists?
					manager = managers.first
					notification = manager.notifications.new(notification_message:"#{name} from your department has a new project pending for your approval.")
				else
					# if no manager, HR manager to approve
					manager = company.users.where(access_level:"admin").first
					notification = manager.notifications.new(notification_message:"#{name} from #{current_user.department} has a new project pending for approval.")
				end

				if notification.save
					ActionCable.server.broadcast "notifications_#{manager.id}",
						message: notification.notification_message,
						id: notification.id
				end

				redirect_to "/"
			end
		end
	end

	def index
		company = current_user.company
		@projects = []
		Project.all.each do |project|
			@projects << project if project.project_owner.company == company
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	def approve
		@project = Project.find(params[:id])
		@project.approved!
		@project.approved_or_refused_by = current_user
		project_owner = @project.project_owner
		if @project.save
			notification = project_owner.notifications.new(notification_message:"Your project #{@project.title} has been approved by your manager #{current_user.first_name}.")
			if notification.save
				ActionCable.server.broadcast "notifications_#{project_owner.id}",
					message: notification.notification_message,
					id: notification.id
			end
			redirect_to "/"
		end
	end

	def refuse
		@project = Project.find(params[:id])
		@project.refused!
		@project.approved_or_refused_by = current_user
		project_owner = @project.project_owner
		if @project.save
			notification = project_owner.notifications.new(notification_message:"Your project #{@project.title} has been declined by your manager #{current_user.first_name}.")
			if notification.save
				ActionCable.server.broadcast "notifications_#{project_owner.id}",
					message: notification.notification_message,
					id: notification.id
			end
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
					notification = User.find(user_id).notifications.new(notification_message:"You have been invited to the project #{@project.title}and your role would be on #{Skill.find(skill_id).skill_name}.")
					if notification.save
						ActionCable.server.broadcast "notifications_#{user_id}",
							message: notification.notification_message,
							id: notification.id
					end
				end
			end
		end
		redirect_to @project
	end

	def invite_approve
		invite = ProjectTeamMember.find(params[:invite_id])
		invite.status = "confirmed"
		if invite.save
			redirect_to "/"
		end
	end
	
	def invite_refuse
		invite = ProjectTeamMember.find(params[:invite_id])
		invite.status = "invite_refused"
		if invite.save
			redirect_to "/"
		end
	end

	def edit_skills
		@project = Project.find(params[:id])
	end

	def update_skills
		@project = Project.find(params[:id])
		@project.skills = Skill.where(id: params[:project][:skills])
		if @project.save
			redirect_to build_squad_path(@project)
		end
	end

	private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
