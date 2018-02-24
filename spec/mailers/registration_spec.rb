require "rails_helper"

RSpec.describe RegistrationMailer, type: :mailer do
  describe "new_registration" do
    let(:mail) { RegistrationMailer.new_registration }

    it "renders the headers" do
      expect(mail.subject).to eq("New registration")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "registration_approved" do
    let(:mail) { RegistrationMailer.registration_approved }

    it "renders the headers" do
      expect(mail.subject).to eq("Registration approved")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
