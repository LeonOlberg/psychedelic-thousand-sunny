# frozen_string_literal: true

class ReferralController < ApplicationController
  include Pagination

  def index
    referrals = Referral.all

    referrals = referrals.where(name: params[:name]) unless params[:name].blank?
    referrals = referrals.where(email: params[:email]) unless params[:email].blank?

    if !params[:order].blank?
      if !params[:specify_order].blank? && ['ASC', 'DESC'].include?(params[:specify_order]&.upcase)
        referrals = referrals.order(params[:order] + ' ' + params[:specify_order])
      else
        referrals = referrals.order(params[:order])
      end
    end

    referrals = referrals.limit(per_page).offset(paginate_offset) if params[:page_num] || params[:per_page]

    referrals.includes(:contact)

    render json: referrals.to_json(include: { contact: { only: [:name, :email, :address] } }, except: :contact_id)
  end

  def show
    referral = Referral.find(params[:id])

    render json: referral.to_json(include: { contact: { only: [:name, :email, :address] } }, except: :contact_id)
  end

  def create
    referral = Referral.create(name: params[:name], email: params[:email], contact_id: params[:contact_id])

    render json: referral.to_json(include: { contact: { only: [:name, :email, :address] } }, except: :contact_id)
  end

  def destroy
    Referral.destroy(params[:id])

    render status: 200
  end
end
