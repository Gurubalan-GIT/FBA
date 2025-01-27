class TripsController < ApplicationController
  helper :application
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :alltrips, :show, :new, :create, :update, :destroy]
  

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  def search 
    @origin = params[:origin]
    @destination = params[:destination]
    @searched_trips = Trip.where(" origin LIKE ? AND destination LIKE ?", @origin, @destination)
  end

  def alltrips
    if(current_user && current_user.admin?)
      @trips = Trip.all    
    else
      redirect_to trips_path, alert: 'You do not have access.'
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trips_path, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:origin, :destination, :departure, :arrival, :cost, :aeroplane_id, :bcfare, :fcfare, :ecfare)
    end
end
