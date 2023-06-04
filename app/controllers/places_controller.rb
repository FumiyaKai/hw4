class PlacesController < ApplicationController

  def index
    if @current_user
      @places = Place.where("user_id" => @current_user["id"])
    else
      @places = []
    end
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.user = @current_user
    if @place.save
      redirect_to "/places"
    else
      render :new
    end
  end

end
