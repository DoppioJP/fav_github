require 'spec_helper'

describe FavController do
  describe "GET / new" do
    it 'allows getting new query' do
      get :new
      response.status.should == 200
    end
  end
  
  describe "POST / create" do
    it 'assigns username' do
      post :create, username: 'geek_on_github'
      assigns(:username).should == 'geek_on_github'
    end
    
    it 'redirects to homepage when user not provided' do
      post :create, username: ""
      response.should redirect_to("/")
    end
    
    it 'redirects to show the user when user exists' do
      post :create, username: "geek_on_github"
      @username = "geek_on_github"
      @username.stub(:on_github?).and_return(true)
      @username.on_github?.should eql true

    end
  end
  
  describe "GET / show" do
    it 'allows viewing details about GitHub user' do
      get :show, username: 'geek_on_github'
      response.status.should == 200
    end
    
    it 'redirects to homepage when username not provided' do
      get :show, username: ""
      response.should redirect_to("/")
    end
  end
end