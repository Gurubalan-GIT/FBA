class Passenger < ApplicationRecord
    belongs_to :user
    has_many :tickets, dependent: :destroy
    has_many :trips, through: :tickets
end
