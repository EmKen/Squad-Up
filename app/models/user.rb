class User < ApplicationRecord
  include Clearance::User

  before_save :generate_private_token

  belongs_to 	:company
  has_many		:user_skills
  has_many		:skills, through: :user_skills
  has_many		:managed_projects, class_name: "Project", foreign_key: "project_owner_id"
  has_many		:project_team_members
  has_many		:projects, through: :project_team_members
  enum access_level: { user: 0, manager: 1, admin: 2 }
  before_save :generate_private_token

  private
  def generate_private_token
  	if private_token.blank?
  		pr = SecureRandom.hex(10)
  		while !User.find_by(private_token:pr).nil?
  			pr = SecureRandom.hex(10)
  		end
  		self.private_token = pr
  	end
  end
end
