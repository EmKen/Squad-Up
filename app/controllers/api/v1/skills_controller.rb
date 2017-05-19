class Api::V1::SkillsController < Api::V1::ApplicationController
	
	def create
		skill = Skill.new(skill_name:params["skill_name"],category:params["category"])
		if skill.save
			render status: 201, json: {success:"skill created"}
		else
			render status: 422, json: skill.errors.messages
		end
	end

	def new
		current_user.skills << Skill.find(params["skill_id"])	
		render json:current_user.skills
	end

	def index
		render json:Skill.all
	end

end
