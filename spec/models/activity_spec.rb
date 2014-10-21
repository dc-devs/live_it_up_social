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

   it 'returns sorted array of activities' do
    act1 = Activity.new(id: 1, title: 'biking', description: 'biking', location: 'SF', category: 'biking')
    act2 = Activity.new(id: 2, title: 'hiking', description: 'hiking', location: 'SF', category: 'hiking')
    act3 = Activity.new(id: 3, title: 'surfing', description: 'surfing', location: 'SF', category: 'surfing')
    Vote.create(id: 1, activity_id: 1)
    Vote.create(id: 2, activity_id: 1)
    Vote.create(id: 3, activity_id: 1)
    Vote.create(id: 4, activity_id: 2)
    Vote.create(id: 5, activity_id: 2)
    Vote.create(id: 6, activity_id: 3)
    activities = [act1, act2, act3]
    expect( Activity.sort_acrtivities( activities )).to eq [act1, act2, act3]

   end
end
