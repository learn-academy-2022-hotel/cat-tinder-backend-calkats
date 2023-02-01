require 'rails_helper'

RSpec.describe Wildcat, type: :model do
  it "should validate name" do
    wildcat = Wildcat.create
    expect(wildcat.errors[:name]).to_not be_empty
  end
end
