require "imageshack"
class UsersController < ApplicationController
  #ssl_required  :create
  #force_ssl :only=>:create
  before_filter :signed_in_user, only: [:edit,:show, :update, :image_wall]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :correct_user_profile,   only: [:show]
  before_filter :admin_user,     only: [:destroy, :index]
  #impressionist
  def show
    @user = User.find(params[:id])
    
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      Emailer.confirmation_email(@user) if Rails.env == 'production'
      sign_in @user
      redirect_to microposts_path
    else
      render 'new'
    end
  end
  
  def edit
    @user=User.find(@current_user.id)
  end
  
  def update
    if params[:user][:upload] #This checks whether user is uploading his pic
      arr = [params[:user][:upload]]
      @url = store_files(arr)
      if @url.first[:url].nil?
        if @url.first[:err] == "auth_error"
          flash[:error] = "We are having some problem with our hosting. So, the image could not be uploaded. Please bear with us."
        else
          flash[:error] = @url.first[:err]
        end
      else
        @recent_pic = Photo.create(:url => @url.first[:url], :user_id => @current_user.id, :profile_pic => 1)
        if @recent_pic
          @old_pic = Photo.where(['user_id=? AND profile_pic=? AND id <> ?', @current_user.id, 1, @recent_pic.id])
          if @old_pic.empty? #checks previously existing profile pic is thr or not
            user_update=User.find(@current_user.id)
            user_update.attributes={:has_pic=>1}
            user_update.save(:validate=>false)
            flash[:success] = "Profile photo is changed"
          else
            @old_pic.first.update_attributes(:profile_pic=>2) #This means prev. profile pic exist
            flash[:success] = "Profile photo is changed"
          end
          session[:picurl]=@recent_pic.url
          session[:has_pic] = 1
        else
          flash[:error] = "Sorry! Photo is not changed"
        end
      end
     render 'edit'
     #The below code is for 3rd case , where user want to go to his gravatar pic again
    #elsif params[:user][:has_pic] #this checks whether user reset his gravatar pic
      #reset_user = User.find(@current_user.id)
      #if reset_user.has_pic
      #  reset_user.attributes = {:has_pic => 0}
       # reset_user.save(:validate=>false)
       # reset_photo = Photo.where(['user_id=? AND profile_pic=?', @current_user.id, 1])
       # reset_photo.first.update_attributes(:profile_pic=>2)
        #flash[:success] = "Profile photo is changed to your gravatar"
      #else
        # flash[:error] = "You already have gravatar as your profile picture"
      #end
     #render 'edit'
    else #This will be executed if nothing above is true, means, he is updating his info only
      @user= User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:success]="Profile Updated"
        cookies[:before_update] = cookies[:last_signin]
        #storing last signin value before its getting updated during signin
        sign_in @user
        #restoring last signin cookie value
        cookies[:last_signin]=cookies[:before_update]
        redirect_to @user
      else
        render 'edit'
      end
    end
  end
  
  def index
    #eager loading
    @users = User.includes(:microposts).paginate(page: params[:page], per_page:20)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  def image_wall
    @user = User.find(session[:userid])
    
    @allpics= Photo.joins(:micropost).joins(:user)
    .joins('INNER JOIN locations ON microposts.location_id = locations.id')
    .select("url, title, username, name, city, state, country").where("profile_pic=?",0)
  end
  
  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(microposts_path) unless current_user?(@user)
    end
    
    def correct_user_profile
      @user = User.find(params[:id])
      @auth="yes" if current_user?(@user)
    end
    
    def admin_user
      unless current_user.admin?
        flash[:error] = "Access Denied"
        redirect_to :back
      end
    end
end
