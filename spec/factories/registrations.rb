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

FactoryBot.define do
  factory :registration do
    user nil
    event nil
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    approved false
    checked_in false
  end
end
