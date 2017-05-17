class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
    	t.string	:skill
    	t.string	:category
    end
  end
end
