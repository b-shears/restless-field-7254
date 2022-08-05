require 'rails_helper'

RSpec.describe 'airline show page' do

  before:each do

    @airline_1 = Airline.create!(name: 'American')
    @airline_2 = Airline.create!(name: 'Delta')
    @airline_3 = Airline.create!(name: 'JetBlue')
    @airline_4 = Airline.create!(name: 'Southwest')

    @flight_1 = @airline_1.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    @flight_2 = @airline_2.flights.create!(number: 3940, date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")
    @flight_3 = @airline_3.flights.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City")
    @flight_4 = @airline_3.flights.create!(number: 6798, date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno")
    @flight_5 = @airline_4.flights.create!(number: 9665, date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans")

    @passenger_1 = Passenger.create!(name: "Brennan Lee Mulligan", age: 13)
    @passenger_2 = Passenger.create!(name: "Aabria Iyengar", age: 9)
    @passenger_3 = Passenger.create!(name: "Bill Seacaster", age: 46)
    @passenger_4 = Passenger.create!(name: "Misty Moore", age: 44)
    @passenger_5 = Passenger.create!(name: "Kingston Brown", age: 84)

    @flight_passenger_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
    @flight_passenger_2 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
    @flight_passenger_3 = FlightPassenger.create!(flight_id: @flight_3.id, passenger_id: @passenger_3.id)
    @flight_passenger_4 = FlightPassenger.create!(flight_id: @flight_4.id, passenger_id: @passenger_4.id)
  end

  it 'shows a list of the passengers that have flights on the particular airline that over age 18' do
    visit "/airline/#{@airline_1.id}"

    expect(page).to have_content(@passenger_1.name)
    expect(page).to_not have_content(@passenger_2.name)
  end
end
