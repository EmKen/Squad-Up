class CreateProjectChats < ActiveRecord::Migration[5.0]
  def change
    create_table :project_chats do |t|
    	t.belongs_to 	:project, index:true
    	t.belongs_to	:user, index:true
    	t.string 			:message
      t.timestamps
    end
  end
end
