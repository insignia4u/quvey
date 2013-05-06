class Survey < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  extend FriendlyId
  include ActsAsStateMachine

  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validate  :expired_at_is_in_the_future

  friendly_id :name, use: :slugged

protected
  def expired_at_is_in_the_future
    if expired_at.present? && expired_at < Time.now
      errors.add(:expired_at, "Expiration date cannot be in the past.")
    end
  end
end
