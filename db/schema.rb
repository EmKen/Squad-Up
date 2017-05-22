# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170521184550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "admin_email"
    t.string   "logo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mentorships", force: :cascade do |t|
    t.integer  "mentor_id"
    t.integer  "mentee_id"
    t.boolean  "request_approval"
    t.text     "mentor_message"
    t.text     "mentee_message"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "project_chats", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_chats_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_chats_on_user_id", using: :btree
  end

  create_table "project_skills", force: :cascade do |t|
    t.integer "project_id"
    t.integer "skill_id"
    t.index ["project_id"], name: "index_project_skills_on_project_id", using: :btree
    t.index ["skill_id"], name: "index_project_skills_on_skill_id", using: :btree
  end

  create_table "project_team_members", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.integer "project_skill_id"
    t.integer "status",           default: 0
    t.index ["project_id"], name: "index_project_team_members_on_project_id", using: :btree
    t.index ["project_skill_id"], name: "index_project_team_members_on_project_skill_id", using: :btree
    t.index ["user_id"], name: "index_project_team_members_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "project_owner_id"
    t.string   "title"
    t.string   "description"
    t.integer  "status",                    default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "approved_or_refused_by_id"
    t.index ["approved_or_refused_by_id"], name: "index_projects_on_approved_or_refused_by_id", using: :btree
    t.index ["project_owner_id"], name: "index_projects_on_project_owner_id", using: :btree
    t.index ["status"], name: "index_projects_on_status", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string "skill_name"
    t.string "category"
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_user_skills_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "company_id"
    t.string   "first_name",                                 null: false
    t.string   "last_name",                                  null: false
    t.string   "job_title",                                  null: false
    t.string   "department",                                 null: false
    t.integer  "access_level",                   default: 0
    t.string   "email",                                      null: false
    t.string   "encrypted_password", limit: 128,             null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,             null: false
    t.string   "private_token"
    t.string   "profile_picture"
    t.boolean  "notification"
    t.index ["company_id"], name: "index_users_on_company_id", using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

end
