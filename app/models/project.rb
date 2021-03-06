class Project < ApplicationRecord
	belongs_to	:project_owner, class_name: "User"
	belongs_to	:approved_or_refused_by, class_name: "User", optional: true
	has_many		:project_skills
	has_many		:skills, through: :project_skills
	has_many		:users, through: :project_team_members
	has_many		:project_team_members
	has_many 		:project_chats
	enum status: { awaiting_approval: 0, approved: 1, refused: 2, complete: 3 }
end
