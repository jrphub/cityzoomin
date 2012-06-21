require "imageshack"

class MicropostsController < ApplicationController
  #impressionist
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy
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
              :latitude=>params[:location][:latitude],:longitude=>params[:location][:longitude]})
       params[:micropost][:location_id] = @location.id
    end

    tmp = params[:micropost][:upload].tempfile
    file = File.join("tmp", params[:micropost][:upload].original_filename)
    FileUtils.cp tmp.path, file
    @url = ImageShack.rest_upload("#{file}")
    FileUtils.rm file
    @micropost=current_user.microposts.build({:content=>params[:micropost][:content],
                                              :location_id=>params[:micropost][:location_id],:title=>params[:micropost][:title],
                                              :category=>params[:micropost][:category]})
    @user = User.new
    #TODO may be we dont need this
    if @micropost.save
      if @url[:url].nil?
        if @url[:err] == "auth_error"
          flash[:error] = "We are having some problem with our hosting. So, the image could not be uploaded. Please bear with us."
        else
          flash[:error] = @url[:err]
        end
      else
        if Photo.create(:url => @url[:url], :user_id => @current_user.id, :micropost_id => @micropost.id, :is_profile => false)
          flash[:success] = "Post Created. Thanks for sharing!"
        else
          flash[:error] = "Post created successfully; but we could not save the image."
        end
      end
      redirect_to microposts_path
    else
      flash[:error] = "File not uploaded successfully,hence post creation failed"
      redirect_to :back
    end
  end


  def index
    @user = User.find(cookies[:userid])
    @allposts = Micropost.joins(:user)
    .joins('INNER JOIN locations ON microposts.location_id = locations.id')
    .select("microposts.id,content, location_id, title, category,microposts.created_at, microposts.updated_at, 
    user_id, locations.name as locname, city, state, country, username, email")
    .paginate(page: params[:page],per_page:3)
    
    #sql version
    #SELECT microposts.id,content, location_id, title, category,microposts.created_at,microposts.updated_at,
    #user_id, locations.name as locname, city, state, country, username FROM `microposts` 
    #INNER JOIN `users` ON `users`.`id` = `microposts`.`user_id` INNER JOIN locations ON microposts.location_id = locations.
    #id ORDER BY microposts.created_at DESC LIMIT 10 OFFSET 0
    
  end
  
  def show
    @user = User.find(cookies[:userid])
    if (params[:id] != 'index')
      @post=Micropost.joins(:user)
      .joins('INNER JOIN locations ON microposts.location_id = locations.id')
      .select("microposts.id,content, location_id, title, category,microposts.created_at, microposts.updated_at, 
      user_id, locations.name as locname, city, state, country,latitude,longitude, username, email").where(:id=>params[:id])
    
    elsif (params[:view] == 'only')
      @allposts = Micropost.joins(:user)
      .joins('INNER JOIN locations ON microposts.location_id = locations.id')
      .select("microposts.id,content, location_id, title, category,microposts.created_at, microposts.updated_at, 
      user_id, locations.name as locname, city, state, country, username, email").where("user_id=?",cookies[:userid])
      .paginate(page: params[:page],per_page:3)
    end
  end
  
  def destroy
      @post = Micropost.find(params[:id])
      @post.destroy
      respond_to do |format|
        format.html { redirect_to :back, :notice=>"Post is deleted successfully" }
        format.json { head :no_content }
        format.js #added
      end
  end
  
  def vote_up
    begin
      current_user.vote_exclusively_for(@post = Micropost.find(params[:id]))
      redirect_to :back
      rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end
  
  def vote_down
    begin
      current_user.vote_exclusively_against(@post = Micropost.find(params[:id]))
      redirect_to :back
      rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end
  
  def comment_create
    @comment = Comment.new({:description => params[:micropost][:description],
              :micropost_id=>params[:micropost][:micropost_id],
              :user_id=>session[:userid], :username=>session[:username], :email=>session[:email]})
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back} #changed
        format.json { render json: @comment, status: :created, location: @comment }
        format.js #added
      else
        format.html { render action: :back } #changed
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
    
  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
    
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
  
end
