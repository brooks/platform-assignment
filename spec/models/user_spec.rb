require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, address, and phone number" do
    expect(build(:brooks_user)).to be_valid
  end

  it "is valid without any attributes!" do
    expect(User.new).to be_valid
  end
end
