# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name, :email, :address, presence: true

  has_many :referrals, dependent: :destroy

  after_create do |contact|
    Event.create(kind: :contact_created, reference: { 'contact_id' => contact.id })
  end
end
