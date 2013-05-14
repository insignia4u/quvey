class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type
  has_many   :question_possible_values, :dependent => :destroy
  
  validates  :question_type, presence: true
  validates  :title, presence: true, uniqueness: { scope: :survey_id }
  validate   :possible_values_for_optional_questions

protected

  def possible_values_for_optional_questions
    if question_type && ['multiple-choise', 'options'].include?(question_type.name)
      unless question_possible_values.any?
        errors.add(:base, "question requires question_posible_value presence")
      end
    end
  end
end
