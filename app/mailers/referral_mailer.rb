# frozen_string_literal: true

class ReferralMailer < ApplicationMailer

  def welcome(referral_id:, referral_email:)
    mail(to: referral_email, subject: 'You have been referred in our platform')

    Event.create(kind: :referral_email_sent, reference: { 'referral_id' => referral_id })
  end
end
