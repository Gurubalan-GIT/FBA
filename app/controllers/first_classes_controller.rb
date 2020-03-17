class FirstClassesController < ApplicationController
  before_action :set_first_class, only: [:show, :edit, :update, :destroy]

  # GET /first_classes
  # GET /first_classes.json
  def index
    @first_classes = FirstClass.all
  end

  # GET /first_classes/1
  # GET /first_classes/1.json
  def show
  end

  # GET /first_classes/new
  def new
    @first_class = FirstClass.new
  end

  # GET /first_classes/1/edit
  def edit
  end

  # POST /first_classes
  # POST /first_classes.json
  def create
    @first_class = FirstClass.new(first_class_params)

    respond_to do |format|
      if @first_class.save
        format.html { redirect_to @first_class, notice: 'First class was successfully created.' }
        format.json { render :show, status: :created, location: @first_class }
      else
        format.html { render :new }
        format.json { render json: @first_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /first_classes/1
  # PATCH/PUT /first_classes/1.json
  def update
    respond_to do |format|
      if @first_class.update(first_class_params)
        format.html { redirect_to @first_class, notice: 'First class was successfully updated.' }
        format.json { render :show, status: :ok, location: @first_class }
      else
        format.html { render :edit }
        format.json { render json: @first_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_classes/1
  # DELETE /first_classes/1.json
  def destroy
    @first_class.destroy
    respond_to do |format|
      format.html { redirect_to first_classes_url, notice: 'First class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first_class
      @first_class = FirstClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def first_class_params
      params.require(:first_class).permit(:seats, :aeroplane_id)
    end
end
