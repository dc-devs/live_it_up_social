require 'spec_helper'

describe Photo do
  it 'belongs to an event' do
    should belong_to(:event)
  end


end
