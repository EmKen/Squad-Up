class CreateProjectSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :project_skills do |t|
    	t.belongs_to :project, index: true
    	t.belongs_to :skill, index: true
    end
  end
end
