# frozen_string_literal: true

class Event < ApplicationRecord
  validates :kind, :reference, presence: true

  enum kind: [:contact_created, :referral_created, :referral_email_waiting_to_be_sent, :referral_email_sent, :contact_deleted, :referral_deleted]
end
