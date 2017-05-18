class Api::V1::SkillsController < Api::V1::ApplicationController
	
	def create
		Skill.create(skill_name:params[:skill_name],category:params[:category])
	end

	def new
		current_user.skills << Skill.find(params[:skill_id])
	end

end
