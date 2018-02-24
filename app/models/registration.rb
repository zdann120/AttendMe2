# == Schema Information
#
# Table name: registrations
#
#  access_key    :string
#  approval_code :string
#  approved      :boolean          default(FALSE), not null
#  checked_in    :boolean          default(FALSE), not null
#  created_at    :datetime         not null
#  email         :string           not null
#  event_id      :uuid
#  first_name    :string           not null
#  id            :uuid             not null, primary key
#  last_name     :string           not null
#  updated_at    :datetime         not null
#  user_id       :uuid
#
# Indexes
#
#  index_registrations_on_access_key  (access_key) UNIQUE
#  index_registrations_on_event_id    (event_id)
#  index_registrations_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (user_id => users.id)
#

class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :email, uniqueness: { scope: :event_id, message: 'already registered for this event' }
  validates :first_name, :last_name, :email, presence: true

  before_save :set_access_key

  has_paper_trail

  def is_approved?
    return true if !self.event.registration_requires_approval?
    approved?
  end

  def set_access_key
    self.access_key = loop do
      key = RandomGenerator.access_key.upcase
      break key unless Registration.exists?(access_key: key)
    end
  end

  def access_keys
    keys = access_key.split('-')
    {key1: keys[0], key2: keys[1]}
  end

  def approve!
    return false if approved?
    code = loop do 
      token = Devise.friendly_token.first(8).upcase.gsub(/\W/, '')
      break token unless Registration.exists?(approval_code: token)
    end
    self.update(
      approved: true,
      approval_code: code
    )
    RegistrationMailer.registration_approved(self.id).deliver_now
  end

  def disapprove!
    return false if !approved?
    self.update!(approved: false, approval_code: nil)
  end
end
