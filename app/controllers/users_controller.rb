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

	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if params[:user].nil? || params[:user][:profile_picture].nil? 
				format.html {
					flash.now[:danger] = "There is no file selected."
					@project = Project.new
					render 'users/show'
				}
				format.js { render:'no_file', status: :unprocessable_entity }
			elsif @user.update(user_params)
				format.html { redirect_back_or user_path(@user) }
				format.js 
			else 
				format.html { 
					flash.now[:danger] = "Invalid file extension, only file of formats .jpg/ .jpeg/ .gif/ .png,/ .tiff are allowed."
					@project = Project.new
					render 'users/show'
				}
				format.js { render:'upload_errors', status: :unprocessable_entity }
			end
		end
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

	private
	def user_params
		params.require(:user).permit(:avatar,:company_id,:first_name,:last_name,:job_title,:department,:profile_picture)
	end

end
