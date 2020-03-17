class EconomyClassesController < ApplicationController
  before_action :set_economy_class, only: [:show, :edit, :update, :destroy]

  # GET /economy_classes
  # GET /economy_classes.json
  def index
    @economy_classes = EconomyClass.all
  end

  # GET /economy_classes/1
  # GET /economy_classes/1.json
  def show
  end

  # GET /economy_classes/new
  def new
    @economy_class = EconomyClass.new
  end

  # GET /economy_classes/1/edit
  def edit
  end

  # POST /economy_classes
  # POST /economy_classes.json
  def create
    @economy_class = EconomyClass.new(economy_class_params)

    respond_to do |format|
      if @economy_class.save
        format.html { redirect_to @economy_class, notice: 'Economy class was successfully created.' }
        format.json { render :show, status: :created, location: @economy_class }
      else
        format.html { render :new }
        format.json { render json: @economy_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /economy_classes/1
  # PATCH/PUT /economy_classes/1.json
  def update
    respond_to do |format|
      if @economy_class.update(economy_class_params)
        format.html { redirect_to @economy_class, notice: 'Economy class was successfully updated.' }
        format.json { render :show, status: :ok, location: @economy_class }
      else
        format.html { render :edit }
        format.json { render json: @economy_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /economy_classes/1
  # DELETE /economy_classes/1.json
  def destroy
    @economy_class.destroy
    respond_to do |format|
      format.html { redirect_to economy_classes_url, notice: 'Economy class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_economy_class
      @economy_class = EconomyClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def economy_class_params
      params.require(:economy_class).permit(:seats, :aeroplane_id)
    end
end
