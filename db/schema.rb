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

ActiveRecord::Schema[7.1].define(version: 2023_12_04_181224) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_sets", force: :cascade do |t|
    t.integer "winner_score", null: false
    t.integer "looser_score", null: false
    t.string "stage"
    t.string "winner_character"
    t.string "looser_character"
    t.bigint "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "winner_id"
    t.bigint "looser_id"
    t.index ["looser_id"], name: "index_game_sets_on_looser_id"
    t.index ["match_id"], name: "index_game_sets_on_match_id"
    t.index ["winner_id"], name: "index_game_sets_on_winner_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "winner_score", null: false
    t.integer "looser_score", null: false
    t.datetime "completed_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "winner_id"
    t.bigint "looser_id"
    t.bigint "tournament_id", null: false
    t.index ["looser_id"], name: "index_matches_on_looser_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
    t.index ["winner_id"], name: "index_matches_on_winner_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.bigint "profil_id", null: false
    t.integer "placement", null: false
    t.integer "seed", null: false
    t.boolean "verified", default: false, null: false
    t.boolean "dq", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profil_id"], name: "index_participations_on_profil_id"
    t.index ["tournament_id"], name: "index_participations_on_tournament_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "profils", force: :cascade do |t|
    t.string "startgg_id", null: false
    t.string "remote_name", null: false
    t.string "remote_team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id"
    t.bigint "team_id"
    t.index ["player_id"], name: "index_profils_on_player_id"
    t.index ["team_id"], name: "index_profils_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name", null: false
    t.string "startgg_event_id", null: false
    t.string "startgg_tournament_id", null: false
    t.string "startgg_slug", null: false
    t.datetime "happened_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["startgg_event_id", "startgg_tournament_id"], name: "idx_on_startgg_event_id_startgg_tournament_id_022324438e", unique: true
  end

  add_foreign_key "game_sets", "matches"
  add_foreign_key "game_sets", "profils", column: "looser_id"
  add_foreign_key "game_sets", "profils", column: "winner_id"
  add_foreign_key "matches", "profils", column: "looser_id"
  add_foreign_key "matches", "profils", column: "winner_id"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "participations", "profils"
  add_foreign_key "participations", "tournaments"
  add_foreign_key "players", "teams"
  add_foreign_key "profils", "players"
  add_foreign_key "profils", "teams"
end
