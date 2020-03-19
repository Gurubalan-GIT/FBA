class Ticket < ApplicationRecord
    belongs_to :passenger, dependent: :destroy
    belongs_to :trip
    accepts_nested_attributes_for :passenger
    before_save :generate_pnr

    def generate_pnr
        selected_trip = Trip.find(trip_id) 
        array = seat_no.split(" ")
        split_seat_no = array[0] 
        split_seat_class = array[1]
        self.seat_no = split_seat_no
        self.seat_class = split_seat_class
        if(split_seat_class == "Business")
            self.pnr = "#{selected_trip.aeroplane.model}" + "BC" + "#{seat_no}" + "#{trip_id}"
        end
    end

end
