require 'rails_helper'

RSpec.describe Wildcat, type: :model do
  it "should validate name" do
    wildcat = Wildcat.create
    expect(wildcat.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    wildcat = Wildcat.create
    expect(wildcat.errors[:age]).to_not be_empty
  end

  it "should validate enjoys" do
    wildcat = Wildcat.create
    expect(wildcat.errors[:enjoys]).to_not be_empty
  end

  it "should validate dislikes" do
    wildcat = Wildcat.create
    expect(wildcat.errors[:dislikes]).to_not be_empty
  end

  it "should validate image" do
    wildcat = Wildcat.create
    expect(wildcat.errors[:image]).to_not be_empty
  end

  it "should validate enjoys length" do
    wildcat = Wildcat.create
    expect(wildcat.errors[:enjoys]).to_not be_empty
  end

  it "should validate dislikes length" do
    wildcat = Wildcat.create
    expect(wildcat.errors[:dislikes]).to_not be_empty
  end

end
