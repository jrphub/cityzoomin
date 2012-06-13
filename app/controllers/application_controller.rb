class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_cache_buster
  include SessionsHelper
  
#This below code prevents browser caching, hence security hole of going back after log out is solved
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  rescue_from ActiveRecord::RecordNotFound, :with=>:record_not_found
  
  private
    def record_not_found
      render :text=>"<h1>404 Not Found</h1>", :status=>404
    end
    
end
