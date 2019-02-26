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

ActiveRecord::Schema.define(version: 2019_02_13_162619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinemas", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "functions", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "started_for", null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.bigint "cinema_id"
    t.bigint "movie_version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_functions_on_cinema_id"
    t.index ["movie_version_id"], name: "index_functions_on_movie_version_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_versions", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "language_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_movie_versions_on_language_id"
    t.index ["movie_id"], name: "index_movie_versions_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "release_date"
    t.integer "duration"
    t.bigint "genre_id"
    t.bigint "language_id"
    t.bigint "classification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_id"], name: "index_movies_on_classification_id"
    t.index ["genre_id"], name: "index_movies_on_genre_id"
    t.index ["language_id"], name: "index_movies_on_language_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "code", null: false
    t.bigint "cinema_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_seats_on_cinema_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "reserved_at"
    t.datetime "closed_at"
    t.bigint "function_id"
    t.bigint "seat_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["function_id"], name: "index_tickets_on_function_id"
    t.index ["seat_id"], name: "index_tickets_on_seat_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "encrypted_password", null: false
    t.datetime "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "functions", "cinemas"
  add_foreign_key "functions", "movie_versions"
  add_foreign_key "movie_versions", "languages"
  add_foreign_key "movie_versions", "movies"
  add_foreign_key "movies", "classifications"
  add_foreign_key "movies", "genres"
  add_foreign_key "movies", "languages"
  add_foreign_key "seats", "cinemas"
  add_foreign_key "tickets", "functions"
  add_foreign_key "tickets", "seats"
  add_foreign_key "tickets", "users"
end
