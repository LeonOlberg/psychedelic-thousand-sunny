# frozen_string_literal: true

class Referral < ApplicationRecord
  validates :name, :email, presence: true

  belongs_to :contact

  before_validation do
    Contact.find(contact_id) or not_found
  end
end
