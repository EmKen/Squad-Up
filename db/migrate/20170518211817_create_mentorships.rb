class CreateMentorships < ActiveRecord::Migration[5.0]
  def change
    create_table :mentorships do |t|
    	t.integer :mentor_id
      t.integer :mentee_id
      t.integer	:status, default: 0
      t.text		:mentor_message
      t.text		:mentee_message
      t.timestamps
    end
  end
end
