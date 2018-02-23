# == Schema Information
#
# Table name: events
#
#  contact_email                  :string
#  created_at                     :datetime         not null
#  description                    :text
#  ends_at                        :datetime         not null
#  id                             :uuid             not null, primary key
#  location                       :string
#  price_cents                    :integer
#  registration_ends_at           :datetime
#  registration_requires_approval :boolean          default(TRUE), not null
#  registration_starts_at         :datetime         not null
#  starts_at                      :datetime         not null
#  title                          :string           not null
#  updated_at                     :datetime         not null
#  user_id                        :uuid
#
# Indexes
#
#  index_events_on_title    (title) UNIQUE
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :event do
    user nil
    title "MyString"
    starts_at "2018-02-23 14:16:00"
    ends_at "2018-02-23 14:16:00"
    description "MyText"
    location "MyString"
    contact_email "MyString"
    registration_starts_at "2018-02-23 14:16:00"
    registration_ends_at "2018-02-23 14:16:00"
    price_cents 1
    registration_requires_approval false
  end
end
