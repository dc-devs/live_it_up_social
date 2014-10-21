require "spec_helper"

describe VotesController do
  describe "GET#index" do
    it "responds succesfully" do
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns a new Vote to @vote" do
      # Activity.create(id: 2, title: "biking", description: "biking", location: "SF", category: "biking")
      # current_user = User.create(id: 1, first_name: "andrew", last_name: "mcdonald", username: "andrew2", motto: "yay", photo: "www.ohot.com", professional_blurb: "yolo", password: "12345", phone_number: "12344444444", remaining_votes: 5)
      # post :create, vote: {'user_id' => 1, 'activity_id' => 2}
      # p Vote.count
      # # expect(Vote.count).to eq(1)
    end
  end
end

