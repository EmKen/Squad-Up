# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  Skill.create(category: "Accounting", skill_name: "Analyzing Data")
  Skill.create(category: "Accounting", skill_name: "Budgeting")
  Skill.create(category: "Accounting", skill_name: "Business Analytics")
  Skill.create(category: "Accounting", skill_name: "Auditing")
  Skill.create(category: "Accounting", skill_name: "Cash Flow Management")
  Skill.create(category: "Accounting", skill_name: "MS Excel")
  Skill.create(category: "Management", skill_name: "Coordination")
  Skill.create(category: "Management", skill_name: "Conflict Resolution")
  Skill.create(category: "Management", skill_name: "Goal Setting")
  Skill.create(category: "Management", skill_name: "Strategic Planning")
  Skill.create(category: "Management", skill_name: "Networking")
  Skill.create(category: "Management", skill_name: "Time Management")
  Skill.create(category: "Management", skill_name: "Decision Making")
  Skill.create(category: "Design", skill_name: "Adobe Photoshop")
  Skill.create(category: "Design", skill_name: "CSS")
  Skill.create(category: "Design", skill_name: "Digital print")
  Skill.create(category: "Design", skill_name: "Creative thinking")
  Skill.create(category: "Design", skill_name: "Storyboard creation")
  Skill.create(category: "Design", skill_name: "Sketching")
  Skill.create(category: "Design", skill_name: "Color theory")
  Skill.create(category: "IT", skill_name: "Cloud Computing")
  Skill.create(category: "IT", skill_name: "Ruby")
  Skill.create(category: "IT", skill_name: "Database Administration")
  Skill.create(category: "IT", skill_name: "Integrated Technologies")
  Skill.create(category: "IT", skill_name: "Linux")
  Skill.create(category: "IT", skill_name: "Network Operations")
  Skill.create(category: "IT", skill_name: "User Experience Design")
  Skill.create(category: "Education", skill_name: "Classroom Management")
  Skill.create(category: "Education", skill_name: "Developing Lesson Plans")
  Skill.create(category: "Education", skill_name: "Evaluating Performance")
  Skill.create(category: "Education", skill_name: "Delivery of Material")
  Skill.create(category: "Education", skill_name: "Setting Expectations")
  Skill.create(category: "Other", skill_name: "Teamwork")
  Skill.create(category: "Other", skill_name: "Research")
  Skill.create(category: "Other", skill_name: "Verbal Communication")
  Skill.create(category: "Other", skill_name: "Negotiating")
end 



user = {}
user['password'] = 'password'
departments = ["Sales", "Marketing", "Finance"]
skill_ids = (1..36).to_a
first_name = Faker::Name.first_name 
last_name = Faker::Name.unique.last_name
email = "#{first_name[0].downcase}.#{last_name.downcase}@nextacademy.com"

ActiveRecord::Base.transaction do
	Company.create(name: "Next Academy", admin_email: email)
end

ActiveRecord::Base.transaction do
  user['first_name'] = first_name 
  user['last_name'] = last_name
  user['email'] = email
  user['company_id'] = 1
  user['job_title'] = "HR Manager"
  user['department'] = "Human Resources"
  user['access_level'] = 2
  user["skills"] = Skill.where(id: skill_ids.sample(rand(5)))

  User.create(user)
end

ActiveRecord::Base.transaction do
	departments.each do |department|
  	first_name = Faker::Name.first_name 
    last_name = Faker::Name.unique.last_name
    user['first_name'] = first_name 
    user['last_name'] = last_name
    user['email'] = "#{first_name[0].downcase}.#{last_name.downcase}@nextacademy.com"
    user['company_id'] = 1
    user['job_title'] = "#{department} Manager"
    user['department'] = department
    user['access_level'] = 1
    user["skills"] = Skill.where(id: skill_ids.sample(rand(5)))

    User.create(user)
  end
end

ActiveRecord::Base.transaction do
  20.times do 
  	first_name = Faker::Name.first_name 
    last_name = Faker::Name.unique.last_name
    department = departments.sample
    role = ["Executive", "Assistant"].sample
    user['first_name'] = first_name 
    user['last_name'] = last_name
    user['email'] = "#{first_name[0].downcase}.#{last_name.downcase}@nextacademy.com"
    user['company_id'] = 1
    user['job_title'] = "#{department} #{role}"
    user['department'] = department
    user['access_level'] = 0
    user["skills"] = Skill.where(id: skill_ids.sample(rand(5)))

    User.create(user)
  end
end 

