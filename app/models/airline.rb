class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers
  # User Story 3, Airline's Passengers
  #
  # As a visitor
  # When I visit an airline's show page
  # Then I see a list of passengers that have flights on that airline
  # And I see that this list is unique (no duplicate passengers)
  # And I see that this list only includes adult passengers
  #
  # (Note: an adult is anyone with age greater than or equal to 18)
  def passengers_over_18(passenger_id)
  
    passengers.select("passengers.*").where('passengers.age > ?', '17').distinct

  end
end
