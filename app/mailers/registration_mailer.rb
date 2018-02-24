class RegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.new_registration.subject
  #
  def new_registration(registration_id)
    @registration = Registration.find(registration_id)
    @event = @registration.event

    mail to: @registration.email,
      from: 'events@zdnmail.com',
      subject: "Registration Receipt for #{@event.title}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.registration_approved.subject
  #
  def registration_approved(registration_id)
    @registration = Registration.find(registration_id)
    @event = @registration.event

    mail to: @registration.email,
      from: 'approvals@zdnmail.com',
      subject: "Registration Approved for #{@event.title}"
  end
end
