Rails.application.routes.draw do
  get "cars" => "cars#index"
  get "cars/:id" => "cars#show", as: "car"
  get "cars/:id/edit" => "cars#edit", as: "edit_car"

end
