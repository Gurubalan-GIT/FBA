class Ticket < ApplicationRecord
    belongs_to :passenger
    belongs_to :trip
    accepts_nested_attributes_for :passenger
    before_save :generate_pnr

    def generate_pnr
        selected_trip = Trip.find(trip_id) 
        first_fare = selected_trip.fcfare
        business_fare = selected_trip.bcfare
        economy_fare = selected_trip.ecfare
        array = seat_no.split(" ")
        split_seat_no = array[0] 
        split_seat_class = array[1]
        self.seat_no = split_seat_no
        self.seat_class = split_seat_class
        if(split_seat_class == "First")
            self.pnr = "#{selected_trip.aeroplane.model}" + "FC" + "#{seat_no}" + "#{trip_id}"
            self.price = first_fare
        end
        if(split_seat_class == "Business")
            self.pnr = "#{selected_trip.aeroplane.model}" + "BC" + "#{seat_no}" + "#{trip_id}"
            self.price = business_fare
        end
        if(split_seat_class == "Economy")
            self.pnr = "#{selected_trip.aeroplane.model}" + "EC" + "#{seat_no}" + "#{trip_id}"
            self.price = economy_fare
        end
    end

end
