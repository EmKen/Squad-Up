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
		mentors_array = []
		current_user.mentors.each do |u|
			user_hash = Mentorship.find_by(mentee_id:current_user.id,mentor_id:u.id).attributes
			user_hash["first_name"] = u.first_name
			user_hash["last_name"] = u.last_name
			mentors_array << user_hash
		end
		render json:mentors_array
	end

	def mentee
		mentees_array = []
		current_user.mentees.each do |u|
			user_hash = Mentorship.find_by(mentee_id:u.id,mentor_id:current_user.id).attributes
			user_hash["first_name"] = u.first_name
			user_hash["last_name"] = u.last_name
			mentees_array << user_hash
		end
		render json:mentees_array
	end
end
