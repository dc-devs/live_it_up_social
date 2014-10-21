require 'spec_helper'

describe Vote do
  it "belongs to a user" do
    should belong_to(:user)
  end

  it "belongs to an activity" do
    should belong_to(:activity)
  end


end
