
class RestaurantsController < ApplicationController
  before_action :user_signed_in?, only: [:new, :create]
  before_action :current_user, only: [:edit, :update, :destroy]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


  #Required for Carrierwave and mini_magick
  require 'carrierwave/orm/activerecord'

  # GET /restaurants
  # GET /restaurants.json
  # to be able to perform the actions of reservations MVC in restaurant for using the form partial in restaurant show http://stackoverflow.com/questions/26159190/rendering-a-form-from-another-controller-in-ruby-on-rails-4

  def index
    @restaurants = Restaurant.all  
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    #set the reservation as instance variable to be available for the show index in restaurant. 
    @reservation = Reservation.new 
    @reservations = Reservation.all  
  end

  # GET /restaurants/new
  #added the current_user in the new and create method as it the restaurant belongs to the user 
  # --- we wanted to make the current_user id to associated with the restaurant. 
  def new
    @restaurant = current_user.restaurants.build
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = current_user.restaurants.build(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :image)
    end
end
