# frozen_string_literal: true

class Contact < ApplicationRecord
  has_many :referrals, dependent: :destroy
end
