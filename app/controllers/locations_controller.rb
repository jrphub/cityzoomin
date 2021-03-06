class LocationsController < ApplicationController
  #impressionist
  include UsersHelper
  def show
    if (params[:city])
      @allposts=Micropost.joins(:user)
      .joins('INNER JOIN locations ON microposts.location_id = locations.id')
      .select("microposts.id,content, has_photo, location_id, title, microposts.created_at, microposts.updated_at,
      user_id, name, city, state, country, username, email, has_pic").where("city=?",params[:city])
      .paginate(page: params[:page],per_page:20)
      @locname=@allposts.first.city
    elsif (params[:state])
      @allposts=Micropost.joins(:user)
      .joins('INNER JOIN locations ON microposts.location_id = locations.id')
      .select("microposts.id,content, has_photo, location_id, title, microposts.created_at, microposts.updated_at,
      user_id,name, city, state, country, username, email, has_pic").where("state=?",params[:state])
      .paginate(page: params[:page],per_page:20)
      @locname=@allposts.first.state
    elsif (params[:country])
      @allposts=Micropost.joins(:user)
      .joins('INNER JOIN locations ON microposts.location_id = locations.id')
      .select("microposts.id,content, has_photo, location_id, title, microposts.created_at, microposts.updated_at,
      user_id,name, city, state, country, username, email, has_pic").where("country=?",params[:country])
      .paginate(page: params[:page],per_page:20)
      @locname=@allposts.first.country
    elsif(params[:id] != 'show')
      @allposts=Micropost.joins(:user)
      .joins('INNER JOIN locations ON microposts.location_id = locations.id')
      .select("microposts.id,content, has_photo, location_id, title, microposts.created_at, microposts.updated_at,
      user_id, name, city, state, country, username, email, has_pic").where(:location_id=>params[:id])
      .paginate(page: params[:page],per_page:20)
      @locname=@allposts.first.name
    end
    @tags = {}
    @allposts.each do |post|
      labels = []
      post.tags.select("label").all.each do |t|
        labels << t.label
      end
      @tags[post.id] = labels
    end
  end
end
