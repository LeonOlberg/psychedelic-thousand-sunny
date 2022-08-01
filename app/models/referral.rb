# frozen_string_literal: true

class Referral < ApplicationRecord
  validates :name, :email, presence: true

  belongs_to :contact

  before_validation do |referral|
    Contact.find(referral.contact_id)
  end

  after_create do |referral|
    Event.create(kind: :referral_created, reference: { 'referral_id' => referral.id , 'contact_id' => referral.contact_id })
  end
end
