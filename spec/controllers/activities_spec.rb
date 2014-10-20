require "spec_helper"

RSpec.describe ActivitiesController, :type => :controller do
  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end

    it "responds with a successful HTTP status" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the activities into @activities" do
      # FactoryGirl would be good here as well as
      # the RSpec idiom is
      #
      # let (:activity1) { FactoryGirl.create(:activity) }
      activity1 = Activity.create(
        title: "Bike to Marin",
        description: "Bike from SF to Marin roundtrip.",
        location: "SF",
        category: "Cycling")
      activity2 = Activity.create(
        title: "Hike Lands End",
        description: "Hike from the Presidio to Sutro Baths.",
        location: "SF",
        category: "Hiking")
      get :index

      expect(assigns(:activities)).to match_array([activity1, activity2])
    end
  end

end

