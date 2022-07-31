class ReferralController < ApplicationController
  include Pagination

  def index
    referrals = Referral.all

    referrals = referrals.limit(per_page).offset(paginate_offset) if params[:page_num] or params[:per_page]

    referrals.includes(:contact)

    render json: referrals.to_json(include: { contact: { only: [ :name, :email ] }})
  end

  def show
  end

  def create
  end

  def destroy
  end
end
