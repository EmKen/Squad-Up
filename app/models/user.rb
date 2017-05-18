class User < ApplicationRecord
  include Clearance::User
  belongs_to 	:company
  has_many		:user_skills
  has_many		:skills, through: :user_skills
  has_many		:managed_projects, class_name: "Project", foreign_key: "project_owner_id"
  has_many		:project_team_members
  has_many		:projects, through: :project_team_members
  enum access_level: { staff: 0, manager: 1, admin: 2 }
end
