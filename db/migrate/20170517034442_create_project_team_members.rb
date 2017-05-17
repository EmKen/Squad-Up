class CreateProjectTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :project_team_members do |t|
    	t.belongs_to :project, index: true
    	t.belongs_to :user, index: true
    	t.belongs_to :project_skill
    end
  end
end
