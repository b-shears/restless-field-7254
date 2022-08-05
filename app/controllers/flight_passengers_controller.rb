class FlightPassengersController < ApplicationController

  def destroy
    passenger = Passenger.find_by(params[:id])
    flight_passenger = passenger.flight_passengers.find_by(flight_id: params[:flight_id])
    flight_passenger.destroy
    redirect_to '/flights'
  end

end
