require 'spec_helper'

describe FavController do
  describe "GET / new" do
    it 'allows getting new query' do
      get :new
      response.status.should == 200
    end
  end
  
  describe "POST / create" do
  end
  
  describe "GET / show" do
    it 'allows viewing details about GitHub user' do
      get :show, username: 'some_user'
      response.status.should == 200
    end
    
    it 'redirects to homepage when username not provided' do
      get :show, username: ""
      response.should redirect_to("/")
    end
  end
end