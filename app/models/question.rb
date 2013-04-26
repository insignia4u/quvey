class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type

  validates :survey, presence: true
  validates :question_type, presence: true
  validates :title, presence: true, uniqueness: { scope: :survey_id }
  validate  :validate_question

  protected
  def validate_question
    if question_type
      if (question_type.name == 'multiple-choise') || (question_type.name == 'options')
        unless question_posible_value
          errors.add(:base, "question requires question_posible_value presence")
        end
      end
    end
  end
end

