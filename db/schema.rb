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

ActiveRecord::Schema.define(version: 20161228210238) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",                           null: false
    t.string   "encrypted_password",     default: "",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.boolean  "enabled",                default: false,                        null: false
    t.string   "time_zone",              default: "Eastern Time (US & Canada)", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "appointments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id",                                             null: false
    t.integer  "teacher_id",                                             null: false
    t.datetime "scheduled_start",                                        null: false
    t.datetime "scheduled_end",                                          null: false
    t.string   "state",                                                  null: false
    t.string   "creator_type",                                           null: false
    t.integer  "creator_id",                                             null: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.boolean  "in_use",                                  default: true
    t.integer  "price",                                                  null: false
    t.integer  "teacher_rate",                                           null: false
    t.decimal  "cost",            precision: 9, scale: 2
    t.index ["student_id", "scheduled_start", "in_use"], name: "index_student_start_in_use", unique: true, using: :btree
    t.index ["student_id", "state", "scheduled_start"], name: "index_appointments_on_student_id_and_state_and_scheduled_start", using: :btree
    t.index ["teacher_id", "scheduled_start", "in_use"], name: "index_teacher_start_in_use", unique: true, using: :btree
    t.index ["teacher_id", "state", "scheduled_start"], name: "index_appointments_on_teacher_id_and_state_and_scheduled_start", using: :btree
  end

  create_table "audits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes", limit: 65535
    t.integer  "version",                       default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index", using: :btree
    t.index ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
    t.index ["created_at"], name: "index_audits_on_created_at", using: :btree
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
    t.index ["user_id", "user_type"], name: "user_index", using: :btree
  end

  create_table "availabilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "start",                               null: false
    t.integer  "end",                                 null: false
    t.integer  "weekly_repeat", limit: 1, default: 0, null: false
    t.integer  "teacher_id",                          null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["teacher_id", "start", "end"], name: "index_availabilities_on_teacher_id_and_start_and_end", unique: true, using: :btree
  end

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "priority",                 default: 0, null: false
    t.integer  "attempts",                 default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                    default: "",        null: false
    t.string   "encrypted_password",       default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "full_name"
    t.string   "time_zone",                default: "Beijing", null: false
    t.integer  "balance",                                      null: false, unsigned: true
    t.string   "age_range"
    t.string   "preferred_teacher_type"
    t.string   "preferred_teacher_gender"
    t.string   "purposes"
    t.index ["email"], name: "index_students_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree
  end

  create_table "students_teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_students_teachers_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_students_teachers_on_teacher_id", using: :btree
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                         default: "",                           null: false
    t.string   "encrypted_password",                            default: "",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                 default: 0,                            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                                           null: false
    t.datetime "updated_at",                                                                           null: false
    t.string   "first_name",                                                                           null: false
    t.string   "last_name",                                                                            null: false
    t.string   "time_zone",                                     default: "Eastern Time (US & Canada)", null: false
    t.integer  "rate",                                                                                 null: false
    t.integer  "balance",                                                                              null: false, unsigned: true
    t.string   "phone"
    t.string   "major"
    t.string   "degree"
    t.boolean  "student"
    t.string   "teaching_experience"
    t.boolean  "certificate"
    t.boolean  "mandarin"
    t.string   "internationalization_experience"
    t.string   "referral"
    t.string   "gender"
    t.string   "age_range"
    t.string   "speech_video"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.text     "intro",                           limit: 65535
    t.index ["email"], name: "index_teachers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true, using: :btree
  end

end
