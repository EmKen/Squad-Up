class AddSkillIdToMentorships < ActiveRecord::Migration[5.0]
  def change
  	add_reference :mentorships, :skill, index: true
  end
end
