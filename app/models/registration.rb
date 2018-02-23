# == Schema Information
#
# Table name: registrations
#
#  approved   :boolean          default(FALSE), not null
#  checked_in :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  email      :string           not null
#  event_id   :uuid
#  first_name :string           not null
#  id         :uuid             not null, primary key
#  last_name  :string           not null
#  updated_at :datetime         not null
#  user_id    :uuid
#
# Indexes
#
#  index_registrations_on_event_id  (event_id)
#  index_registrations_on_user_id   (user_id)
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
end
