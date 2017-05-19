class CreateMentorships < ActiveRecord::Migration[5.0]
  def change
    create_table :mentorships do |t|
    	t.integer :mentor_id
      t.integer :mentee_id
      t.boolean	:request
      t.string	:message
      t.timestamps
    end
  end
end
