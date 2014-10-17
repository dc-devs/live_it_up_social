require 'spec_helper'

describe Trip do
  it " belongs to a user" do
    should belong_to(:user)
  end

  it " belongs to an event" do
    should belong_to(:event)
  end
end
