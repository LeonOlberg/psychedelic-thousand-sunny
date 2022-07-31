require 'rails_helper'

RSpec.describe "Referrals", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/referral/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/referral/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/referral/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/referral/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
