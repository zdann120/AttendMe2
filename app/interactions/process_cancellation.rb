class ProcessCancellation < ActiveInteraction::Base
  string :key1
  string :key2
  string :email

  def execute
    key = [key1.upcase, key2.upcase].join('-')
    registration = Registration.find_by(access_key: key)
    if registration
      return false unless registration.email == email
      registration.destroy
      registration
    else
      errors.add(:key, 'is invalid')
    end
  end
end