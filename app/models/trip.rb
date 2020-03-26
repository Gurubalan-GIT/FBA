class Trip < ApplicationRecord
    validates :origin, :destination, :departure, :arrival, :fcfare, :bcfare, :ecfare, presence: true
    belongs_to :aeroplane
    has_many :tickets, dependent: :destroy
    has_many :passengers, through: :tickets
end
