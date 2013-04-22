class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to  :survey
      t.belongs_to  :question_type
      t.string      :title

      t.timestamps
    end

    add_index :questions, :survey_id
    add_index :questions, :question_type_id
    add_index :questions, :title, :unique => true
  end
end
