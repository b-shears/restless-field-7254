Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/flights", to: "flights#index"
  get "/airlines/:airline_id", to: "airlines#show"
  delete "/flight_passengers/:flight_id/:passenger_id", to: "flight_passengers#destroy"
end
