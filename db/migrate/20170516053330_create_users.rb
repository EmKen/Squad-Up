class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.belongs_to :company, index: true
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.string  :job_title, null: false
      t.string  :department, null: false
      t.integer :access_level, default: 0
      t.string  :email, null: false
      t.string  :encrypted_password, limit: 128, null: false
      t.string  :confirmation_token, limit: 128
      t.string  :remember_token, limit: 128, null: false
      t.string  :private_token
      t.string  :profile_picture
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
