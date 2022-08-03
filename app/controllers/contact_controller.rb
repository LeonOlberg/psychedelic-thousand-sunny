# frozen_string_literal: true

class ContactController < ApplicationController
  include Pagination

  def index
    contacts = Contact.all

    contacts.where(params.permit(:name, :email, :address))

    if !params[:order_by].blank?
      if !params[:specify_order].blank? && ['ASC', 'DESC'].include?(params[:specify_order]&.upcase)
        contacts = contacts.order(params[:order_by] + ' ' + params[:specify_order])
      else
        contacts = contacts.order(params[:order_by])
      end
    end

    contacts = contacts.limit(per_page).offset(paginate_offset) if params[:page_num] || params[:per_page]

    if contacts.any?
      render json: contacts.to_json
    else
      render status: 404
    end
  end

  def show
    contact = Contact.find(params[:id])

    render json: contact.to_json
  end

  def create
    contact = Contact.create(name: params[:name], email: params[:email], address: params[:address])

    render json: contact
  end

  def destroy
    Contact.destroy(params[:id])

    render status: 200
  end
end
