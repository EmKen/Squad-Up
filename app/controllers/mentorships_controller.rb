class MentorshipsController < ApplicationController

	def create
		@mentorship = Mentorship.new(mentorship_params)
		@mentor = User.find(params[:mentorship][:mentor_id])
		@mentorship.mentee_id = current_user.id
		if @mentorship.save
      
			#### this part is for notification

			name = "#{current_user.first_name} #{current_user.last_name}"
			skill_name = Skill.find(params[:mentorship][:skill_id]).skill_name
			notification = User.find(params[:mentorship][:mentor_id]).notifications.new(notification_message:"You have a mentorship request from #{name}! #{current_user.first_name} is interested in learning from you on #{skill_name}.")
			if notification.save
				ActionCable.server.broadcast "notifications_#{params[:mentorship][:mentor_id]}", 
					message:notification.notification_message,
					id: notification.id
			end

      flash[:success] = "Your mentorship request has been sent to #{@mentor.first_name} #{@mentor.last_name}."
		else
			flash[:danger] = "#{@mentorship.errors.full_messages.join(". ")}."
    end
			
		redirect_to skills_path
	end

	def accept_mentee
		current_params = accept_mentee_params
		current_params[:mentor_id] = current_user.id
		@mentorship = Mentorship.find(params[:mentorship_id])
		if @mentorship.update(current_params)
			respond_to do |format|
				format.html { 
					flash[:success] = "You have accepted #{User.find(current_params[:mentee_id]).first_name}'s request to be your mentee."
					redirect_to users_path(current_user)
				}
				format.js {}
			end
		else
			respond_to do |format|
				format.html { 
					flash.now[:danger] = "#{@mentorship.errors.full_messages.join(". ")}."
					render 'users/show'
				}
				format.js { render:mentor_error, status: :unprocessable_entity }
			end
		end
	end	

	private
	def mentorship_params
		params.require(:mentorship).permit(:mentor_id, :skill_id, :mentee_message)
	end

	def accept_mentee_params
		params.require(:mentorship).permit(:mentee_id, :mentor_message, :status)
	end

end
