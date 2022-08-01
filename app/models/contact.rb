# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name, :email, :address, presence: true

  has_many :referrals, dependent: :destroy
end
