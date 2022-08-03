require 'rails_helper'

RSpec.describe ReferralMailer, type: :request do
  describe "when mailer is called to send an email" do
    it "sends an email" do
      referral = create(:referral)

      expect { ReferralMailer.welcome(referral_id: referral.id, referral_email: referral.email).deliver_now }
        .to change { ActionMailer::Base.deliveries.length }.by(1)
    end
  end
end
