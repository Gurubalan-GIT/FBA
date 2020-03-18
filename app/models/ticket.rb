class Ticket < ApplicationRecord
    belongs_to :passenger, dependent: :destroy
    belongs_to :trip
    accepts_nested_attributes_for :passenger
end
