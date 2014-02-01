class FavController < ApplicationController
  def new
    
  end
  
  def create
    
  end
  
  def show
    username = params[:username]
    redirect_to root_path unless username.present?
  end
  
end