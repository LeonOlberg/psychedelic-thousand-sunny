require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is valid when all attributes are present" do
    expected_result = build(:contact)

    expect(expected_result).to be_valid
  end

  it "is not valid when name is not present" do
    expected_result = build(:contact, name: nil)

    expect(expected_result).to_not be_valid
  end

  it "is not valid when email is not present" do
    expected_result = build(:contact, email: nil)

    expect(expected_result).to_not be_valid
  end

  it "is not valid when address is not present" do
    expected_result = build(:contact, address: nil)

    expect(expected_result).to_not be_valid
  end
end
