class FavController < ApplicationController
  def new
    
  end
  
  def create
    @username = params[:username]
    if @username.present?
      redirect_to fav_path(username: @username)
    else
      redirect_to root_path
    end
  end
  
  def show
    @username = params[:username]
    redirect_to root_path unless @username.present?
    
    @user = User.new(@username)
  end
  
end