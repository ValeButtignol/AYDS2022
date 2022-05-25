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

ActiveRecord::Schema[7.0].define(version: 2022_05_19_015639) do
  create_table "administrators", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forecasts", force: :cascade do |t|
    t.integer "home_goals"
    t.integer "visitor_goals"
    t.string "winner"
    t.integer "player_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_forecasts_on_match_id"
    t.index ["player_id"], name: "index_forecasts_on_player_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "stadium"
    t.datetime "date"
    t.integer "home_team_id"
    t.integer "visitor_team_id"
    t.integer "administrator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_id"], name: "index_matches_on_administrator_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["visitor_team_id"], name: "index_matches_on_visitor_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer "home_goals"
    t.integer "visitor_goals"
    t.string "winner"
    t.integer "match_id"
    t.integer "administrator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_id"], name: "index_results_on_administrator_id"
    t.index ["match_id"], name: "index_results_on_match_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "administrator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_id"], name: "index_teams_on_administrator_id"
  end

  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "matches", "teams", column: "visitor_team_id"
end
