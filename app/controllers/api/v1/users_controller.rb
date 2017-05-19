class Api::V1::UsersController < Api::V1::ApplicationController
	def show
		user = User.find(params[:id])
		give_user_info(user)
	end

	def index
		company = current_user.company
		users = User.where("company_id = #{company.id}")
		render json:users
	end	

	def update
		current_params = params
		current_params.delete("private_token")
		current_params.delete("sessions")
		current_user.update(current_params)
	end

	def give_user_info(user_or_id)
		if user_or_id.integer?
			user = User.find(user_id)
		else 
			user = user_or_id
		end
		skills = user.skills

		own_project = user.managed_projects 
		own_project_array = give_project_array_of_hashes(own_project,user.id)

		joined_project = user.projects - own_project
		joined_project_array = give_project_array_of_hashes(joined_project,user.id)

		render json:[user,skills,own_project_array,joined_project_array]
	end

	def give_current_user
		give_user_info(current_user)
	end

	private

	def give_project_array_of_hashes(projects,user_id)
		# turn them into array of hashes
		projects_array = projects.map { |project| project.attributes }

		projects.each_with_index do |project,i|
			# extract the roles (could be more than one)
			skill_ids = ProjectTeamMember.joins(:project_skill).where({project_id:project.id,user_id:user_id}).pluck('project_skills.skill_id')
			skills = Skill.where(id:skill_ids)

			# map skills into array of hashes
			skills = skills.map { |skill| skill.attributes } 
			
			# projects_array[i] is hash, so this is inserting values for key 'skills_array' into the hash.
			projects_array[i]['skills_array'] = skills 
		end
	end

end
