require 'spec_helper'

describe User do
  describe "on_github?" do
    it 'confirms that user is on GitHub' do
      @user = User.new("geek_on_github")
      @user.on_github?.should == true
    end
    
    it 'shows user is not on GitHub' do
      @user = User.new("geek_not_on_github")
      @user.on_github?.should == false
    end
  end
  
  describe "languages" do
  end
end