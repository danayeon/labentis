# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_31_063000) do

  create_table "matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.integer "track", null: false
    t.integer "lyric", null: false
    t.integer "singer", null: false
    t.integer "video", null: false
    t.integer "permission"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_matches_on_project_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.text "statement", null: false
    t.bigint "track_user_id"
    t.bigint "lyric_user_id"
    t.bigint "singer_user_id"
    t.bigint "video_user_id"
    t.bigint "manage_user_id"
    t.text "link"
    t.text "overview"
    t.datetime "upload_at"
    t.integer "reported"
    t.integer "alert"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lyric_user_id"], name: "index_projects_on_lyric_user_id"
    t.index ["manage_user_id"], name: "index_projects_on_manage_usre_id"
    t.index ["singer_user_id"], name: "index_projects_on_singer_user_id"
    t.index ["track_user_id"], name: "index_projects_on_track_user_id"
    t.index ["video_user_id"], name: "index_projects_on_video_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "type"
    t.integer "reported"
    t.integer "alert"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "matches", "projects"
  add_foreign_key "matches", "users"
  add_foreign_key "projects", "users", column: "lyric_user_id"
  add_foreign_key "projects", "users", column: "manage_user_id"
  add_foreign_key "projects", "users", column: "singer_user_id"
  add_foreign_key "projects", "users", column: "track_user_id"
  add_foreign_key "projects", "users", column: "video_user_id"
end
