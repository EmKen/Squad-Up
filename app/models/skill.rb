class Skill < ApplicationRecord
	has_many	:user_skills
	has_many	:users, through: :user_skills
	has_many	:project_skills
	has_many	:projects, through: :project_skills
	has_many	:mentorships
	validates :category, presence: {message: "Please select a category to add a new skill" }
	validates :skill_name, uniqueness: { case_sensitive: false, message: "%{value} is not a new skill, please select it from the dropdown lists"}
end
