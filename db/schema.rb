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

ActiveRecord::Schema.define(version: 20180220140557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempts", force: :cascade do |t|
    t.string "biz_id"
    t.text "functionf"
    t.integer "nb_of_second_spent"
    t.integer "nb_of_lint_warning"
    t.integer "nb_of_lint_error"
    t.integer "nb_of_green_test"
    t.integer "nb_of_red_test"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id"
    t.string "score"
    t.index ["question_id"], name: "index_attempts_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "level"
    t.datetime "available_at"
    t.string "biz_id"
    t.text "description"
    t.jsonb "tests", default: "{}"
    t.text "initial"
    t.integer "point_max"
    t.float "point_loss"
    t.integer "point_plateau"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attempts", "questions"
end
