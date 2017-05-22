class MentorshipsController < ApplicationController

	def create
		@mentorship = Mentorship.new(mentorship_params)
		@mentorship.mentee_id = current_user.id
		if @mentorship.save
		end
	end

	private
	def mentorship_params
		params.require(:mentorship).permit(:mentor_id, :skill_id, :mentee_message)
	end

end
