class ChangeMessagesColumnForProjectChats < ActiveRecord::Migration[5.0]
  def change
  	change_table :project_chats do |t|
  		t.change :message, :text
  	end
  end
end
