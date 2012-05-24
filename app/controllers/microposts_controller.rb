class MicropostsController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @loc_name=params[:q]
    @micropost=current_user.microposts.build(params[:micropost])
    
  end
  
  def create
    @location=Location.new({:name => params[:location][:name], :city => params[:location][:city],
              :state => params[:location][:state], :country => params[:location][:country]})
    
    if @location.save
      params[:micropost][:location_id] = @location.id
    end          
    @micropost=current_user.microposts.build({:content=>params[:micropost][:content],
               :location_id=>params[:micropost][:location_id],:title=>params[:micropost][:title],
               :category=>params[:micropost][:category]})
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
