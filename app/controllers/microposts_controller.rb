class MicropostsController < ApplicationController
  before_filter :signed_in_user
  def new
    @loc_name=params[:q]
    @micropost=current_user.microposts.build(params[:micropost])
  end
  
  def create
    @new_location=Location.find_by_name(params[:location][:name])
    if @new_location
       params[:micropost][:location_id] = @new_location.id
    else
       @location=Location.create({:name => params[:location][:name], :city => params[:location][:city],
              :state => params[:location][:state], :country => params[:location][:country],
              :latitude => params[:location][:latitude], :longitude => params[:location][:longitude]})
       params[:micropost][:location_id] = @location.id
    end
    
    @micropost=current_user.microposts.build({:content=>params[:micropost][:content],
               :location_id=>params[:micropost][:location_id],:title=>params[:micropost][:title],
               :category=>params[:micropost][:category]})
    @user = User.new
    if @micropost.save
      flash[:success] = "Post Created. Thanks for sharing!"
      redirect_to microposts_path
    else
      flash[:error] = "Creation failed. Please try again"
      redirect_to current_user
    end
  end
  
  def index
    @allposts = Micropost.joins(:user)
    .joins('INNER JOIN locations ON microposts.location_id = locations.id')
    .select("microposts.id,content, location_id, title, category,microposts.created_at, microposts.updated_at, 
    user_id, locations.name as locname, city, state, country, username, email")
    .paginate(page: params[:page],per_page:3)
    
    #sql version
    #SELECT microposts.id,content, location_id, title, category,microposts.created_at,microposts.updated_at,
    #user_id, locations.name as locname, city, state, country, users.name as username FROM `microposts` 
    #INNER JOIN `users` ON `users`.`id` = `microposts`.`user_id` INNER JOIN locations ON microposts.location_id = locations.
    #id ORDER BY microposts.created_at DESC LIMIT 10 OFFSET 0
  end
  
end
