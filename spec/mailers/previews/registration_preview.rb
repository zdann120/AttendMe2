# Preview all emails at http://localhost:3000/rails/mailers/registration
class RegistrationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/registration/new_registration
  def new_registration
    RegistrationMailer.new_registration
  end

  # Preview this email at http://localhost:3000/rails/mailers/registration/registration_approved
  def registration_approved
    RegistrationMailer.registration_approved
  end

end
