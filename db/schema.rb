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

ActiveRecord::Schema.define(version: 2021_01_03_174518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_genres", force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_artist_genres_on_artist_id"
    t.index ["genre_id"], name: "index_artist_genres_on_genre_id"
  end

  create_table "artist_networks", force: :cascade do |t|
    t.string "social_link"
    t.string "user_name"
    t.bigint "artist_id", null: false
    t.bigint "network_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_artist_networks_on_artist_id"
    t.index ["network_id"], name: "index_artist_networks_on_network_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "photourl"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dpa_id"
    t.string "spotify_artist_id"
    t.index ["dpa_id"], name: "index_artists_on_dpa_id"
  end

  create_table "dpas", force: :cascade do |t|
    t.string "description"
    t.integer "hierarchy"
    t.string "bg_url"
    t.integer "dpa_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dpa_id"], name: "index_dpas_on_dpa_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.string "bg_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "networks", force: :cascade do |t|
    t.string "name"
    t.string "icon_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.string "track_url"
    t.integer "priority"
    t.string "album_bg_url"
    t.bigint "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "album_name"
    t.bigint "dpa_id"
    t.index ["artist_id"], name: "index_tracks_on_artist_id"
    t.index ["dpa_id"], name: "index_tracks_on_dpa_id"
  end

  add_foreign_key "artist_genres", "artists"
  add_foreign_key "artist_genres", "genres"
  add_foreign_key "artist_networks", "artists"
  add_foreign_key "artist_networks", "networks"
  add_foreign_key "artists", "dpas"
  add_foreign_key "dpas", "dpas"
  add_foreign_key "tracks", "artists"
  add_foreign_key "tracks", "dpas"
end
