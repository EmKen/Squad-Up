class AddStatusToProjectTeamMembers < ActiveRecord::Migration[5.0]
  def change
  	add_column :project_team_members, :status, :integer, index: true, default: 0
  end
end
