class ProjectTeamMember < ApplicationRecord
	belongs_to :project
	belongs_to :user
	belongs_to :project_skill
	enum status: { awaiting_confirmation: 0, confirmed: 1, invite_refused: 2 }
end
