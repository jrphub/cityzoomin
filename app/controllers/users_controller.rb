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
    @user=User.find(params[:id])
  end
  
  def update
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
      render "edit"
    end
  end
  
  def index
    #eager loading
    @users = User.includes(:microposts).paginate(page: params[:page], per_page:5)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  def image_wall
    @user = User.find(session[:userid])
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
