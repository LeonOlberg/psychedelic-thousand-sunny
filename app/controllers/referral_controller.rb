# frozen_string_literal: true

class ReferralController < ApplicationController
  include Pagination

  def index
    referrals = Referral.all

    referrals.where(params.permit(:name, :email, :contact_id))

    if !params[:order_by].blank?
      if !params[:specify_order].blank? && ['ASC', 'DESC'].include?(params[:specify_order]&.upcase)
        referrals = referrals.order(params[:order_by] + ' ' + params[:specify_order])
      else
        referrals = referrals.order(params[:order_by])
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
    referral = Referral.create!(name: params[:name], email: params[:email], contact_id: params[:contact_id])

    render json: referral.to_json(include: { contact: { only: [:name, :email, :address] } }, except: :contact_id)
  end

  def destroy
    Referral.destroy(params[:id])

    render status: 200
  end
end
