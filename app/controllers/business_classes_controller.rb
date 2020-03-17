class BusinessClassesController < ApplicationController
  before_action :set_business_class, only: [:show, :edit, :update, :destroy]

  # GET /business_classes
  # GET /business_classes.json
  def index
    @business_classes = BusinessClass.all
  end

  # GET /business_classes/1
  # GET /business_classes/1.json
  def show
  end

  # GET /business_classes/new
  def new
    @business_class = BusinessClass.new
  end

  # GET /business_classes/1/edit
  def edit
  end

  # POST /business_classes
  # POST /business_classes.json
  def create
    @business_class = BusinessClass.new(business_class_params)

    respond_to do |format|
      if @business_class.save
        format.html { redirect_to @business_class, notice: 'Business class was successfully created.' }
        format.json { render :show, status: :created, location: @business_class }
      else
        format.html { render :new }
        format.json { render json: @business_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_classes/1
  # PATCH/PUT /business_classes/1.json
  def update
    respond_to do |format|
      if @business_class.update(business_class_params)
        format.html { redirect_to @business_class, notice: 'Business class was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_class }
      else
        format.html { render :edit }
        format.json { render json: @business_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_classes/1
  # DELETE /business_classes/1.json
  def destroy
    @business_class.destroy
    respond_to do |format|
      format.html { redirect_to business_classes_url, notice: 'Business class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_class
      @business_class = BusinessClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_class_params
      params.require(:business_class).permit(:seats, :aeroplane_id)
    end
end
