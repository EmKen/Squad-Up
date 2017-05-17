class Skill < ApplicationRecord
	has_many	:employees, through: :employee_skills
	has_many	:projects, through: :project_skills
end
