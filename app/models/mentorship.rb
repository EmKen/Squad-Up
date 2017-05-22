class Mentorship < ApplicationRecord
	belongs_to :mentor, class_name:"User"
	belongs_to :mentee, class_name:"User"
	belongs_to :skill
	enum status: { awaiting_acceptance: 0, accepted: 1, refused: 2 }
end
