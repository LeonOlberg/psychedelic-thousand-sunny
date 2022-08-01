require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid when all attributes are present" do
    expected_result = build(:event)

    expect(expected_result).to be_valid
  end

  it "is not valid when kind is not present" do
    expected_result = build(:event, kind: nil)

    expect(expected_result).to_not be_valid
  end

  it "is not valid when reference is not present" do
    expected_result = build(:event, reference: nil)

    expect(expected_result).to_not be_valid
  end
end
