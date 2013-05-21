# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130422051926) do

  create_table "question_possible_values", :force => true do |t|
    t.integer  "question_id"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "question_possible_values", ["question_id", "title"], :name => "index_question_possible_values_on_question_id_and_title", :unique => true
  add_index "question_possible_values", ["question_id"], :name => "index_question_possible_values_on_question_id"

  create_table "question_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "question_types", ["name"], :name => "index_question_types_on_name", :unique => true

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "question_type_id"
    t.string   "title"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "questions", ["question_type_id"], :name => "index_questions_on_question_type_id"
  add_index "questions", ["survey_id", "title"], :name => "index_questions_on_survey_id_and_title", :unique => true
  add_index "questions", ["survey_id"], :name => "index_questions_on_survey_id"

  create_table "surveys", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "state"
    t.datetime "expired_at"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "surveys", ["expired_at"], :name => "index_surveys_on_expired_at"
  add_index "surveys", ["slug"], :name => "index_surveys_on_slug", :unique => true
  add_index "surveys", ["user_id"], :name => "index_surveys_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "users", ["oauth_token"], :name => "index_users_on_oauth_token", :unique => true
  add_index "users", ["provider", "uid"], :name => "index_users_on_provider_and_uid", :unique => true

end
