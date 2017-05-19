class AddApprovedOrRefusedByToProjects < ActiveRecord::Migration[5.0]
  def change
  	add_reference :projects, :approved_or_refused_by, index: true
  end
end
