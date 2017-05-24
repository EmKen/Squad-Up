# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Faker::UniqueGenerator.clear


user = {}
user['password'] = 'password'
departments = ["Sales", "Marketing", "Finance"]

ActiveRecord::Base.transaction do
	Company.create(name: "Next Academy", admin_email: "b.jones@nextacademy.com")
end

ActiveRecord::Base.transaction do
  user['first_name'] = "Bob"
  user['last_name'] = "Jones"
  user['email'] = "b.jones@nextacademy.com"
  user['company_id'] = 1
  user['job_title'] = "HR Manager"
  user['department'] = "Human Resources"
  user['access_level'] = 2

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

    User.create(user)
  end
end

user_ids = []
User.all.each { |user| user_ids << user.id }

ActiveRecord::Base.transaction do
  Skill.create(category: "Accounting", skill_name: "Analyzing Data", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Accounting", skill_name: "Budgeting", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Accounting", skill_name: "Business Analytics", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Accounting", skill_name: "Auditing", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Accounting", skill_name: "Cash Flow Management", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Accounting", skill_name: "MS Excel", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Management", skill_name: "Coordination", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Management", skill_name: "Conflict Resolution", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Management", skill_name: "Goal Setting", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Management", skill_name: "Strategic Planning", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Management", skill_name: "Networking", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Management", skill_name: "Time Management", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Management", skill_name: "Decision Making", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Design", skill_name: "Adobe Photoshop", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Design", skill_name: "CSS", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Design", skill_name: "Digital print", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Design", skill_name: "Creative thinking", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Design", skill_name: "Storyboard creation", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Design", skill_name: "Sketching", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Design", skill_name: "Color theory", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "IT", skill_name: "Cloud Computing", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "IT", skill_name: "Ruby", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "IT", skill_name: "Database Administration", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "IT", skill_name: "Integrated Technologies", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "IT", skill_name: "Linux", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "IT", skill_name: "Network Operations", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "IT", skill_name: "User Experience Design", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Education", skill_name: "Classroom Management", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Education", skill_name: "Developing Lesson Plans", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Education", skill_name: "Evaluating Performance", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Education", skill_name: "Delivery of Material", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Education", skill_name: "Setting Expectations", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Other", skill_name: "Event Planning", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Other", skill_name: "Video Editing", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Other", skill_name: "Physio Theraphy", users: User.where(id: user_ids.sample(rand(5)+1)))
  Skill.create(category: "Other", skill_name: "Writing", users: User.where(id: user_ids.sample(rand(5)+1)))
end


ActiveRecord::Base.transaction do
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 1, title: "Digital Length Measurement", description: "Public sector project under the supervision of the defence ministry", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 2, title: "Electronic Card Locking System", description: "Public sector project under the supervision of the defence ministry", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 3, title: "Access Controlled System", description: "Public sector project under the supervision of the defence ministry", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 4, title: "Advanced Elevator Control", description: "Public sector project under the supervision of the defence ministry", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 5, title: "Digital Tachometer", description: "Public sector project under the supervision of the defence ministry", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 6, title: "Traffic Light control System", description: "Public sector project under the supervision of the defence ministry", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 7, title: "Tale Recorder for Industries", description: "Public sector project with a cooperation with tenaga nacional", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 8, title: "Digital Thermometer", description: "Public sector project with a cooperation with tenaga nacional", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 9, title: "Mains Frequency Indicator", description: "Public sector project with a cooperation with tenaga nacional", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 10, title: "Programmable Volume Control", description: "Public sector project with a cooperation with tenaga nacional", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 11, title: "Hexadecimal Keyboard", description: "Public sector project with a cooperation with tenaga nacional", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 12, title: "Security Monitoring System", description: "Public sector project with a cooperation with tenaga nacional", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 13, title: "Binary To Dot-Matrix Decoder", description: "Public sector project with a cooperation with tenaga nacional", skills: Skill.where(id: ids))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 14, title: "Precise Digital AC Power Controller", description: "Private project, subcontract with danata Dubai", skills: Skill.where(id: ids), status: "approved", users: User.joins(:skills).where({skills: {id: ids}}).limit(rand(3)+3))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 15, title: "Digital Switching System", description: "Private project, subcontract with danata Dubai", skills: Skill.where(id: ids), status: "approved", users: User.joins(:skills).where({skills: {id: ids}}).limit(rand(3)+3))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 16, title: "Programmable Melody Generator", description: "Private project, subcontract with danata Dubai", skills: Skill.where(id: ids), status: "approved", users: User.joins(:skills).where({skills: {id: ids}}).limit(rand(3)+3))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 17, title: "Pressure Monitor", description: "Private project, subcontract with danata Dubai", skills: Skill.where(id: ids), status: "approved", users: User.joins(:skills).where({skills: {id: ids}}).limit(rand(3)+3))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 18, title: "Digital Programmable Dark Room Controller", description: "Private project, subcontract with danata Dubai", skills: Skill.where(id: ids), status: "approved", users: User.joins(:skills).where({skills: {id: ids}}).limit(rand(3)+3))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 19, title: "Object Counter for Industrial Application", description: "Private project, subcontract, Malaysian airline", skills: Skill.where(id: ids), status: "approved", users: User.joins(:skills).where({skills: {id: ids}}).limit(rand(3)+3))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 20, title: "Universal Digital Function Generator", description: "Private project, subcontract, Malaysian airline", skills: Skill.where(id: ids), status: "approved", users: User.joins(:skills).where({skills: {id: ids}}).limit(rand(3)+3))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 21, title: "Automatic Spray Painting Gun", description: "Private project, subcontract, Malaysian airline", skills: Skill.where(id: ids), status: "approved", users: User.joins(:skills).where({skills: {id: ids}}).limit(rand(3)+3))
  ids = (1..36).to_a.sample(rand(5)+3)
  Project.create(project_owner_id: 22, title: "Motor Speed Controller", description: "Private project, subcontract, Malaysian airline", skills: Skill.where(id: ids), status: "approved", users: User.joins(:skills).where({skills: {id: ids}}).limit(rand(3)+3))

end


ActiveRecord::Base.transaction do


  Mentorship.create(mentor_id:1,mentee_id:23,mentor_message:"See you soon at 23 :)",mentee_message:"Please mentor me :)", skill_id:User.find(1).skills.sample.id)
  Mentorship.create(mentor_id:1,mentee_id:22,mentor_message:"See you at 22:)",mentee_message:"Please mentor me :)", skill_id:User.find(1).skills.sample.id)
  Mentorship.create(mentor_id:5,mentee_id:1,mentor_message:"Okay",mentee_message:"Please mentor me :)",skill_id:User.find(5).skills.sample.id)
  Mentorship.create(mentor_id:10,mentee_id:1,mentor_message:"No problem",mentee_message:"Please mentor me :)",skill_id: User.find(10).skills.sample.id)


end

arr = ["https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/1/mark-melbourne.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/3/4.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/5/alanreid.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/7/9.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/6/joshua-jackson-fringes-faces-of-fox-campaign-02.JPG", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/11/13.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/9/suits_cast_rachel.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/10/12.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/12/14.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/18/20.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/13/Gabriel_Macht_3241.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/14/16.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/15/17.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/16/21.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/17/19.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/19/21.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/20/22.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/21/24.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/22/rick-hoffman-as-louis-litt.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/23/3.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/24/square-holding-meghan-markle-suits.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/4/5.jpg", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/8/Characters_mike_ross_usa_network_gallery_khaki_shirt_03.png", "https://squad-up-bucket.s3.amazonaws.com/uploads/user/profile_picture/2/10129_1227084712608_1093750327_725452_821210_n.jpg"]

User.all.each_with_index do |user,i|
  user.remote_profile_picture_url = arr[i]
  user.save
end
