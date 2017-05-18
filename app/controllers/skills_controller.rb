class SkillsController < ApplicationController
	def show
		@skills = current_user.skills
	end

	def index
		@skills = Skill.all
	end

	def create
		@skill = current_user.skills.new(skill_params)
		respond_to do |format|
			format.js
		end
	end

	private
	def skill_params
		params.require(:skill).permit(:skill_name, :category)
	end
end
