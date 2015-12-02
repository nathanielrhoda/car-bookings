Rails.application.routes.draw do
  root "cars#index"
  resources :cars do 
  	resources :reviews
  end
end
