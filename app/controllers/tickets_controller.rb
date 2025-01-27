class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action do 
    redirect_to new_user_session_path unless current_user
  end

  # GET /tickets
  # GET /tickets.json
  def index
    if(current_user && current_user.admin?)
      @tickets = Ticket.all
    else
      redirect_to passengers_path, alert: 'You do not have access. Please view tickets from passengers.'
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    if params[:trip_id]
      trip_id = params[:trip_id].to_i
      @trip = Trip.find(trip_id)
      @ticket = Ticket.new
      @ticket.build_passenger
    else
      redirect_to search_path, notice: 'Choose Trip'
    end
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.trip_id = params[:trip_id]
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to passengers_path, notice: 'Ticket was successfully booked.' }
        format.json { render :show, status: :created, location: @ticket }
        ActionMailer::Base.smtp_settings = {
          :address              => "smtp.gmail.com",
          :port                 => 587,
          :user_name            => 'gurubalan@commutatus.com',
          :password             => 'gtgvmzkmnpkxzdgd',
          :authentication       => "plain",
          :enable_starttls_auto => true
        }

        TicketMailer.with(user:current_user, ticket: @ticket, passenger: @ticket.passenger).new_ticket_email.deliver_now!

      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to passengers_path, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
        ActionMailer::Base.smtp_settings = {
          :address              => "smtp.gmail.com",
          :port                 => 587,
          :user_name            => 'gurubalan@commutatus.com',
          :password             => 'gtgvmzkmnpkxzdgd',
          :authentication       => "plain",
          :enable_starttls_auto => true
        }

        TicketMailer.with(user:current_user, ticket: @ticket, passenger: @ticket.passenger).update_ticket_email.deliver_now!
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to passengers_path, notice: 'Ticket was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:id, :pnr, :seat_class, :seat_no, :passenger_id, :trip_id, :price, passenger_attributes: [:id, :name, :email, :age, :user_id])
    end
end
