class LocationsController < ApplicationController
  before_action :set_user
  before_action :set_user_location, only: [:show, :update, :destroy]

  # GET /users/:user_id/locations
  def index
    @locations = current_user.locations
    @lat = 0.0
    @lon = 0.0
    if @locations.count > 0 
      @locations.each do |location|
        @lat += location[:latitude]
        @lon += location[:longitude]
      end
      @lat /= @locations.count
      @lon /= @locations.count
    end
    #json_response(@locations)
  end

  # GET /users/:user_id/locations/:id
  def show
    json_response(@location)
  end

  def new
    @location = current_user.locations.build if logged_in?
  end

  # POST /users/:user_id/locations
  def create
    current_user.locations.create!(location_params)
    #json_response(@user, :created)
    redirect_to user_locations_path(current_user)
  end

  # PUT /users/:user_id/locations/:id
  def update
    @location.update(location_params)
    head :no_content
  end

  # DELETE /users/:user_id/locations/:id
  def destroy
    @location.destroy
    head :no_content
  end

  private

  def location_params
    #params.permit(:latitude, :longitude, :user_id)
    params.require(:location).permit(:latitude, :longitude, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_location
    @location = @user.locations.find_by!(id: params[:id]) if @user
  end
end
