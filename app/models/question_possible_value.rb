class QuestionPossibleValue < ActiveRecord::Base
  belongs_to :question

  validates :question, presence: true
  validates :title, presence: true, uniqueness: { scope: :question_id }
end
