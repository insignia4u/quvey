class CreateQuestionPossibleValues < ActiveRecord::Migration
  def change
    create_table :question_possible_values do |t|
      t.belongs_to  :question
      t.string      :title

      t.timestamps
    end

    add_index :question_possible_values, :question_id
    add_index :question_possible_values, [:question_id, :title], :unique => true
  end
end
