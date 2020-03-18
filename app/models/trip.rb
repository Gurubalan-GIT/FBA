class Trip < ApplicationRecord
    belongs_to :aeroplane
    has_many :tickets
    has_many :passengers, through: :tickets
end
