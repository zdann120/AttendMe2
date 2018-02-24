class ProcessCancellation < ActiveInteraction::Base
  string :cancellation_code
  string :email

  def execute
    registration = Registration.find_by(access_key: cancellation_code.upcase)
    if registration
      return false unless registration.email == email
      registration.destroy
      registration
    else
      errors.add(:key, 'is invalid')
    end
  end
end