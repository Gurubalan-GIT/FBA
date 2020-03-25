class Aeroplane < ApplicationRecord
    has_many :trips, dependent: :destroy
    has_many :passengers
    validate :check_limts
    before_save :total_seats


    def check_limts
        if(fc_column > 7)
            errors.add(:fc_column, "The maximum number of columns allowed is 7")
        end
        if(fc_row > 10)
            errors.add(:fc_row, "The maximum number of rows allowed is 10")
        end

        if(bc_column > 7)
            errors.add(:bc_column, "The maximum number of columns allowed is 7")
        end
        if(bc_row > 10)
            errors.add(:bc_row, "The maximum number of rows allowed is 10")
        end
        if(ec_column > 7)
            errors.add(:ec_column, "The maximum number of columns allowed is 7")
        end
        if(ec_row > 10)
            errors.add(:ec_row, "The maximum number of rows allowed is 10")
        end
    end

    def total_seats
        seats = ((fc_column*fc_row)+(bc_column*bc_row)+(ec_column*ec_row))
        self.seats = seats
    end
end
