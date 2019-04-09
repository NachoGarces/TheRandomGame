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

ActiveRecord::Schema.define(version: 2019_04_09_192722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acounts", force: :cascade do |t|
    t.string "nicks"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_acounts_on_player_id"
  end

  create_table "nicknames", force: :cascade do |t|
    t.string "nick"
    t.bigint "player_id"
    t.bigint "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_nicknames_on_player_id"
    t.index ["site_id"], name: "index_nicknames_on_site_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.string "avatar"
    t.integer "rags", default: 0
    t.integer "points", default: 0
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

  create_table "players_tournaments", id: false, force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "tournament_id", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "namesite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.bigint "player_id"
    t.string "description"
    t.integer "bet_amounts"
    t.string "winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "typetournament_id"
    t.integer "maxteam"
    t.integer "maxplayers"
    t.index ["player_id"], name: "index_tournaments_on_player_id"
    t.index ["typetournament_id"], name: "index_tournaments_on_typetournament_id"
  end

  create_table "typetournaments", force: :cascade do |t|
    t.string "typetournamentname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "acounts", "players"
  add_foreign_key "nicknames", "players"
  add_foreign_key "nicknames", "sites"
  add_foreign_key "tournaments", "players"
  add_foreign_key "tournaments", "typetournaments"
end
