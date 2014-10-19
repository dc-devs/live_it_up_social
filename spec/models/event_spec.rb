require 'spec_helper'

describe Event do
  
  it "belongs to an activity" do
    should belong_to(:activity)
  end

  it "has many trips" do
    should have_many(:trips)
  end

  it "has many users" do
    should have_many(:users).through(:trips)
  end

end
