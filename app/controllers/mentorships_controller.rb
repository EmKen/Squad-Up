class MentorshipsController < ApplicationController

	def create
		@mentorship = Mentorship.new(mentorship_params)
		@mentor = User.find(params[:mentorship][:mentor_id])
		@mentorship.mentee_id = current_user.id
		if @mentorship.save
			flash[:success] = "Your mentorship request has been sent to #{@mentor.first_name} #{@mentor.last_name}."
			redirect_to skills_path
		end
	end

	private
	def mentorship_params
		params.require(:mentorship).permit(:mentor_id, :skill_id, :mentee_message)
	end

end
