# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_10_030355) do
  create_table "admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forecasts", force: :cascade do |t|
    t.integer "home_goals"
    t.integer "visitor_goals"
    t.string "winner"
    t.integer "player_user_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_forecasts_on_match_id"
    t.index ["player_user_id"], name: "index_forecasts_on_player_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "stadium"
    t.datetime "date"
    t.integer "local_team_id"
    t.integer "visitor_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["local_team_id"], name: "index_matches_on_local_team_id"
    t.index ["visitor_team_id"], name: "index_matches_on_visitor_team_id"
  end

  create_table "player_users", force: :cascade do |t|
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer "local_goals"
    t.integer "visitor_goals"
    t.string "winner"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_results_on_match_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "unique_emails", unique: true
    t.index ["username"], name: "unique_usernames", unique: true
  end

  add_foreign_key "matches", "teams", column: "local_team_id"
  add_foreign_key "matches", "teams", column: "visitor_team_id"
end
