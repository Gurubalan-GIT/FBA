class TicketMailer < ApplicationMailer
    default from: 'gurubalan@commutatus.com'

    def new_ticket_email
        @ticket = params[:ticket]
        @passenger = params[:passenger]
        mail(to: @passenger.email, subject: "You got a new Meeting!")
    end
end
