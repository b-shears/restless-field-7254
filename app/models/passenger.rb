class Passenger < ApplicationRecord
  has_many :flights
  has_many :passenger_flights
  has_many :passenger, through: :passenger_flights
end
