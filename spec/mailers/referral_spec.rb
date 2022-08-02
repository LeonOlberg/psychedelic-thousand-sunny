require 'rails_helper'

RSpec.describe ReferralMailer, type: :request do
  describe "when mailer is called to send an email" do
    it "sends an email" do
      referral = create(:referral)

      ReferralMailer.welcome(referral_id: referral.id, referral_email: referral.email).deliver_now

      expect(ActionMailer::Base.deliveries.length).to eq(1)
    end
  end
end
