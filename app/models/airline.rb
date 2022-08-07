class Airline < ApplicationRecord
  has_many :flights
  # has_many :flight_passengers, through: :flights
  # has_many :passengers, through: :flight_passengers

  # def passengers_over_18
  #   # require "pry"; binding.pry
  #   passengers.select("passengers.*").where('passengers.age >= ?', 18).distinct
  # end

  def passengers_over_18
    flights.joins(:passengers)
    .select('passengers.*')
    .where('passengers.age >= ?', 18)
    .distinct.pluck(:name)
  end
end
