# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name, :email, :address, presence: true
  after_create :contact_created_event
  after_destroy :contact_deleted_event

  has_many :referrals, dependent: :destroy

  private

  def contact_created_event
    Event.create!(kind: :contact_created, reference: { 'contact_id' => id })
  end

  def contact_deleted_event
    Event.create!(kind: :contact_deleted, reference: { 'contact_id' => id })
  end
end
