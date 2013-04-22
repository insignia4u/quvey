class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type

  validates :survey, presence: true
  validates :question_type, presence: true
  validates :title, presence: true, uniqueness: { scope: :survey_id }
end
