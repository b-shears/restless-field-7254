class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passengers
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights
end
