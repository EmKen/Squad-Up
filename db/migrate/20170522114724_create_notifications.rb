class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
    	t.text :notification_message
    	t.integer :read_status, default: 0
    	t.belongs_to :user, index:true
      t.timestamps
    end
  end
end
