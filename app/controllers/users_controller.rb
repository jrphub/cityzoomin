class UsersController < ApplicationController
  
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :correct_user_profile,   only: [:show]
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
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
      sign_in @user
      redirect_to @user
    else
      render "edit"
    end
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
end
