class TicketMailer < ApplicationMailer
    helper :application
    default from: 'gurubalan@commutatus.com'

    def new_ticket_email
        @user = params[:user]
        @ticket = params[:ticket]
        @passenger = params[:passenger]
        mail(to: @passenger.email, subject: "#{@passenger.name}, You've got a new Journey!")
    end

    def update_ticket_email
        @user = params[:user]
        @ticket = params[:ticket]
        @passenger = params[:passenger]
        mail(to: @passenger.email, subject: "#{@passenger.name}, Your ticket has been updated!")
    end
end
