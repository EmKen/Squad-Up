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

	private
	def mentorship_params
		params.require(:mentorship).permit(:mentor_id, :skill_id, :mentee_message)
	end

end
