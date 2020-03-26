class Passenger < ApplicationRecord
    validates :name, :email, :age, presence: true
    belongs_to :user
    has_many :tickets, dependent: :destroy
    has_many :trips, through: :tickets
end
