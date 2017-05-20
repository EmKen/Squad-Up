class UsersController < Clearance::UsersController
	before_action :require_login
	def show
		@user = User.find(params[:id])
		@project = Project.new
	end

	def skills
		@user = User.find(params[:id])
		@current_skills = @user.skills
		@skill = @user.skills.new
	end

	def add_skills
		@user = User.find(params[:id])
		if params[:skill_ids].present?
			params[:skill_ids].each do |skill_id|
				UserSkill.create(user_id: @user.id, skill_id: skill_id)
			end
		end
		if params[:skill][:skill_name]
			skill = Skill.new(skill_name: params[:skill][:skill_name].titleize, category: params[:skill][:category])
			if skill.save
				UserSkill.create(user_id: @user.id, skill_id: skill.id)
			else
				errors = []
    		skill.errors.messages.values.each do |msg|
        	msg.each do  |m|
          	errors << m
        	end
				end
				flash.alert = errors
			end
		end
		redirect_to user_skills_path(@user)
	end
end
