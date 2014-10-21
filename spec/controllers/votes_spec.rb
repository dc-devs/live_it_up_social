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

  end
end

