class Skill < ApplicationRecord
	has_many	:employee_skills
	has_many	:employees, through: :employee_skills
	has_many	:project_skills
	has_many	:projects, through: :project_skills
end
