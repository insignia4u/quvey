class Survey < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  extend FriendlyId
  include ActsAsStateMachine

  belongs_to :user
  has_many   :questions, :dependent => :destroy

  validates :user, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validate  :expired_at_is_in_the_future

  friendly_id :name, use: :slugged

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? },
    :allow_destroy => true

  def self.build_survey(current_user)
    @survey = current_user.surveys.build
    @question = @survey.questions.build
    @survey
  end

protected
  def expired_at_is_in_the_future
    if expired_at.present? && expired_at < Time.now
      errors.add(:expired_at, "Expiration date cannot be in the past.")
    end
  end
end
