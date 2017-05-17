class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
    	t.references	:project_owner, index: true
    	t.string			:title
    	t.string			:description
    	t.integer			:status, default: 0, index: true
      t.timestamps
    end
  end
end
