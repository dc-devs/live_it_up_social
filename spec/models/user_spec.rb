require 'spec_helper'

RSpec.describe User, :type => :model do
  it "is valid with password" do
     user = User.new(
      password: "12345")
     expect(user).to be_valid
   end

   it "is created" do
    user = User.create(
      first_name: "Alex",
      last_name: "Bob",
      password: "12345")
    expect(user.first_name).to eq("Alex")
   end
end
