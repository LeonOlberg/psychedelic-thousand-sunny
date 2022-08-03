# frozen_string_literal: true

class Referral < ApplicationRecord
  validates :name, :email, presence: true
  before_validation :check_contact
  after_create :referral_created_event, :wellcome_mail_event_waiting_to_be_sent
  after_destroy :referral_deleted_event

  belongs_to :contact

  private

  def check_contact
    Contact.find(contact_id)
  end

  def referral_created_event
    Event.create!(kind: :referral_created, reference: { 'referral_id' => id , 'contact_id' => contact_id })
  end

  def wellcome_mail_event_waiting_to_be_sent
    ReferralMailer.welcome(referral_id: id, referral_email: email).deliver_later
    Event.create!(kind: :referral_email_waiting_to_be_sent, reference: { 'referral_id' => id })
  end

  def referral_deleted_event
    Event.create!(kind: :referral_deleted, reference: { 'referral_id' => id })
  end
end
