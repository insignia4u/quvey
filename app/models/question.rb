class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type
  has_many   :question_possible_value

  validates :survey, presence: true
  validates :question_type, presence: true
  validates :title, presence: true, uniqueness: { scope: :survey_id }
  validate  :possible_value_not_assign
  
protected
  def possible_value_not_assign
      unless question_possible_value
        errors.add(:without_posible_values, "dasdasdsa")
      end
  end
end
