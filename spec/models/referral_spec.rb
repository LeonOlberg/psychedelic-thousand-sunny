require 'rails_helper'

RSpec.describe Referral, type: :model do
  it "is valid when all attributes are present" do
    an_contact = create(:contact)
    expected_result = create(:referral, contact_id: an_contact.id)

    expect(expected_result).to be_valid
  end

  it "is not valid when name is not present" do
    an_contact = create(:contact)
    expected_result = build(:referral, name: nil, contact_id: an_contact.id)

    expect(expected_result).to_not be_valid
  end

  it "is not valid when email is not present" do
    an_contact = create(:contact)
    expected_result = build(:referral, email: nil, contact_id: an_contact.id)

    expect(expected_result).to_not be_valid
  end

  xit "is not valid when address is not present" do
    example = build(:referral)

    expect { Referral.new(name: example.name, email: example.email, contact_id: nil) }.to raise_exception(ActiveRecord::RecordNotFound)
    expect(expected_result).to_not be_valid
  end
end
