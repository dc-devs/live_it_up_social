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
      pending "I am broken!"
      Activity.create(id: 2, title: "biking", description: "biking", location: "SF", category: "biking")
      post :create, vote: {'user_id' => 1, 'activity_id' => 2}
      p Vote.count
      expect(Vote.count).to eq(1)
    end
  end
end

