class Aeroplane < ApplicationRecord
    has_many :trips, dependent: :destroy
    has_many :passengers
end
