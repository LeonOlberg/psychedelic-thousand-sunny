require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  before :each do
    Event.destroy_all
    Referral.destroy_all
    Contact.destroy_all
  end

  context "GET /index" do
    context "when no param is passed" do
      it "returns a list of all contacts with referral" do
        create_list(:contact, 5)
        expected_result = Contact.all.to_json

        get "/contact"

        expect(response.body).to eq expected_result
        expect(response).to have_http_status(:success)
      end
    end

    context "when a param is passed" do
      context "when a name is passed as param to search" do
        it "returns only contacts that matchers with param name" do
          expected_result = create_list(:contact, 1)

          get "/contact", :params => { :name => expected_result[0].name }

          expect(response.body).to eq expected_result.to_json
          expect(response).to have_http_status(:success)
        end
      end

      context "when an email is passed as param to search" do
        it "returns only contacts that matchers with param name" do
          expected_result = create_list(:contact, 1)

          get "/contact", :params => { :email => expected_result[0].email }

          expect(response.body).to eq expected_result.to_json
          expect(response).to have_http_status(:success)
        end
      end

      context "when an order config is passed as param to search" do
        context "when an order specification is not passed as param to search" do
          it "returns all contacts ordered as param" do
            expected_result = create_list(:contact, 5).sort_by(&:name)

            get "/contact", :params => { :order_by => 'name' }

            expect(response.body).to eq expected_result.to_json
            expect(response).to have_http_status(:success)
          end
        end

        context "when an order specification is passed as param to search" do
          it "returns all contacts ordered as param" do
            expected_result = create_list(:contact, 5).sort_by(&:name).reverse

            get "/contact", :params => { :order_by => 'name' , :specify_order => 'desc'}

            expect(response.body).to eq expected_result.to_json
            expect(response).to have_http_status(:success)
          end
        end
      end

      context "when a pagination config is passed as param to search" do
        context "when only page num is passed" do
          it "returns only one contact per page from second page num as default is one" do
            all_contacts = create_list(:contact, 5)
            expected_result = [all_contacts[1]]

            get "/contact", :params => { :page_num => 2 }

            expect(response.body).to eq expected_result.to_json
            expect(response).to have_http_status(:success)
          end
        end

        context "when only per page is passed" do
          it "returns two contacts from first page num as default is one" do
            all_contacts = create_list(:contact, 5)
            expected_result = [all_contacts[0], all_contacts[1]]

            get "/contact", :params => { :per_page => 2 }

            expect(response.body).to eq expected_result.to_json
            expect(response).to have_http_status(:success)
          end
        end

        context "when both page num and per page is passed" do
          it "returns two contacrs per page from the seconde page num" do
            all_contacts = create_list(:contact, 5)
            expected_result = [all_contacts[2], all_contacts[3]]

            get "/contact", :params => { :page_num => 2, :per_page => 2 }

            expect(response.body).to eq expected_result.to_json
            expect(response).to have_http_status(:success)
          end
        end
      end

      context "when ordered and pagination param is passed" do
        it "return a list of contacts ordered and paginated" do
          all_contacts = create_list(:contact, 5).sort_by(&:name).reverse
          expected_result = [all_contacts[2], all_contacts[3]]

          get "/contact", :params => { :order_by => 'name', :specify_order => 'desc' , :page_num =>2, :per_page => 2 }

          expect(response.body).to eq expected_result.to_json
          expect(response).to have_http_status(:success)
        end
      end
    end
  end

  context "GET /show" do
    it "returns http success" do
      expected_result = create(:contact)

      get "/contact/#{expected_result.id}"

      expect(response.body).to eq expected_result.to_json
      expect(response).to have_http_status(:success)
    end
  end

  context "POST /create" do
    context "when all parameters are all right" do
      it "returns http success" do
        contact = create(:contact)

        post "/contact", :params => { :name => 'Assunção', :email => 'assumption@me.com', :address => 'Some address 182 street 2' }

        expected_result = Contact.find_by(name: 'Assunção', email: 'assumption@me.com', address: 'Some address 182 street 2')

        expect(response.body).to eq expected_result.to_json
        expect(response).to have_http_status(:success)
      end
    end
  end

  context "GET /destroy" do
    it "returns http success" do
      contact = create(:contact)
      referral = create(:referral, contact_id: contact.id)

      delete "/contact/#{contact.id}"

      expected_referral = Referral.exists?(id: referral.id)
      expected_contact = Contact.exists?(id: contact.id)

      expect(expected_contact).to be false
      expect(expected_referral).to be false
      expect(response).to have_http_status(:success)
    end
  end
end
