ActiveRecord::Schema.define(:version => 20130422051926) do

  create_table "question_possible_values", :force => true do |t|
    t.integer  "question_id"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "question_possible_values", ["question_id"], :name => "index_question_possible_values_on_question_id"
  add_index "question_possible_values", ["title"], :name => "index_question_possible_values_on_title", :unique => true

  create_table "question_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "question_type_id"
    t.string   "title"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "questions", ["question_type_id"], :name => "index_questions_on_question_type_id"
  add_index "questions", ["survey_id"], :name => "index_questions_on_survey_id"
  add_index "questions", ["title"], :name => "index_questions_on_title", :unique => true

  create_table "surveys", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "state"
    t.string   "expired_at"
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
