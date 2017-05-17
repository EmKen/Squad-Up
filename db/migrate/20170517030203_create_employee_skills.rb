class CreateEmployeeSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_skills do |t|
    	t.belongs_to :employee, index: true
    	t.belongs_to :skill, index: true
      t.timestamps
    end
  end
end
