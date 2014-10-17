require 'spec_helper'

RSpec.describe Activity, :type => :model do
  it "is valid with a title, description, location, category" do
     activity = Activity.new(
      title: "Bike to Marin",
      description: "Bike from SF to Marin roundtrip.",
      location: "SF",
      category: "Cycling")
     expect(activity).to be_valid
   end

   it "is created" do
    activity = Activity.new(
      title: "Bike to Marin",
      description: "Bike from SF to Marin roundtrip.",
      location: "SF",
      category: "Cycling")
    expect(activity.title).to eq("Bike to Marin")
   end

   it "belongs to user" do
     should belong_to(:user)
   end

   it "has many votes" do
      should have_many(:votes)
   end
end
