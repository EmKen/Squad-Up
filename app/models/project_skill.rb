class ProjectSkill < ApplicationRecord
	belongs_to 	:project
	belongs_to 	:skill
	has_many		:employees, through: :project_team_members
end