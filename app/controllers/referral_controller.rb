class ReferralController < ApplicationController
  def index
    referrals = Referral.includes(:contact)
    referral_with_contact = referrals.map do |referral|
      {
        :id => referral.id,
        :name => referral.name,
        :email => referral.email,
        :contact =>
        { :name => referral.contact.name,
          :email => referral.contact.email
        },
        :created_at => referral.created_at,
    		:updated_at => referral.updated_at
      }
    end.flatten

    render json: referral_with_contact
  end

  def show
  end

  def create
  end

  def destroy
  end
end
