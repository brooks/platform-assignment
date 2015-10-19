require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:all) do
    12.times{ FactoryGirl.create(:brooks_user)}
  end
  
  describe "GET index" do

    it "finds the correct number of total users" do
      get :index
      expect(assigns(:users).count).to eq(12)
    end

    it "returns a maximum of 500 total users" do
      1000.times{ FactoryGirl.create(:maggie_user)}
      get :index
      expect(assigns(:users).count).to eq(500)
    end
  end

  describe "POST search" do

    before(:all) do
      73.times{ FactoryGirl.create(:maggie_user)}
    end

    it "finds the correct number of users when searching by name" do
      post :search, query: 'Brooks', format: :json
      expect(assigns(:users).count).to eq(12)
    end

    it "finds the correct number of users when searching by street address" do
      post :search, query: 'Alliklik', format: :json
      expect(assigns(:users).count).to eq(73)
    end

    it "finds the correct number of users when searching by city" do
      post :search, query: 'Lake Tahoe', format: :json
      expect(assigns(:users).count).to eq(73)
    end

    it "finds the correct number of users when searching by state" do
      post :search, query: 'California', format: :json
      expect(assigns(:users).count).to eq(85)
    end

    it "finds the correct number of users when searching by state" do
      post :search, query: '94114', format: :json
      expect(assigns(:users).count).to eq(12)
    end
    
    it "finds the correct number of users when searching by phone" do
      post :search, query: '555-2020', format: :json
      expect(assigns(:users).count).to eq(73)
    end
  
  end

end



