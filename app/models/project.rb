class Project < ApplicationRecord
	belongs_to	:project_owner, class_name: "Employee"
	has_many		:skills, through: :project_skills
	has_many		:employees, through: :project_team_members
	enum status: { awaiting_approval: 0, approved: 1, refused: 2 }
end
