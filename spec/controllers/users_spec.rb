require "spec_helper"

RSpec.describe UsersController, :type => :controller do
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

    it "loads all of the users into @users" do
      # Also, factory and let()
      user1 = User.create(
        first_name: "Alex",
        last_name: "Bob",
        password: "12345")
      user2 = User.create(
        first_name: "Melissa",
        last_name: "Porto",
        password: "12345")
      get :index

      expect(assigns(:users)).to match_array([user1, user2])
    end
  end

end

