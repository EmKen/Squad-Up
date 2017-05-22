class User < ApplicationRecord
  include Clearance::User

  before_save :generate_private_token

  belongs_to 	:company
  has_many		:user_skills
  has_many		:skills, through: :user_skills
  has_many		:managed_projects, class_name: "Project", foreign_key: "project_owner_id"
  has_many		:approved_or_refused_projects, class_name: "Project", foreign_key: "approved_or_refused_by_id"
  has_many		:project_team_members
  has_many		:projects, through: :project_team_members

  has_many    :mentees, through: :menteeing, source: :mentee
  has_many    :menteeing, foreign_key:'mentor_id', class_name:"Mentorship"

  has_many    :mentors, through: :mentoring, source: :mentor
  has_many    :mentoring, foreign_key:'mentee_id', class_name:"Mentorship"

  mount_uploader :profile_picture, AvatarUploader

  enum access_level: { staff: 0, manager: 1, admin: 2 }
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
