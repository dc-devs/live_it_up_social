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
      post :create, vote: {'user_id' => 1, 'activity_id' => 1}
      expect(Vote.count).to eq(1)
    end
  end
end

