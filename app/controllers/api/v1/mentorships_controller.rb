class Api::V1::MentorshipsController < Api::V1::ApplicationController
	def create_mentor
		mentorship = Mentorship.new(mentor_id:params["mentor_id"],mentee_id:current_user.id,mentee_message:params["mentee_message"])
		if mentorship.save
			render status: 201, json: {success:"mentorship created"}
		else
			render status: 422, json: mentorship.errors.messages
		end
	end

	def accept_mentee
		mentorship = Mentorship.find_by(mentor_id:current_user.id,mentee_id:params["mantee_id"])
		if !mentorship
			render status: 404, json: {error: "Mentorship relation not found"}
		else
			if mentorship.update(request_approved:params["request_approval"],mentor_message:params["mentor_message"])
				render status: 202, json: mentorship 
			else 
				render status: 422, json: mentorship.errors.messages
			end
		end
	end

	def mentor # show all mentor for current user
		render json:current_user.mentors.ids
	end

	def mentee
		render json:current_user.mentees.ids
	end
end
