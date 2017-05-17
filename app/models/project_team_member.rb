class ProjectTeamMember < ApplicationRecord
	belongs_to :project
	belongs_to :employee
	belongs_to :project_skill
end
