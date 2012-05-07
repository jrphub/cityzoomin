class MicropostsController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @city=params[:q]
    @micropost=current_user.microposts.build(params[:micropost])
  end
  
  def create
    @micropost=current_user.microposts.build(params[:micropost])
    @user = User.new
    if @micropost.save
      flash[:success] = "Post Created. Thanks for sharing!"
      redirect_to current_user
    else
      flash[:error] = "Creation failed. Please try again"
      redirect_to current_user
    end
  end
  
end
