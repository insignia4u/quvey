class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type
  has_many   :question_possible_values

  validates :survey, presence: true
  validates :question_type, presence: true
  validates :title, presence: true, uniqueness: { scope: :survey_id }
end
