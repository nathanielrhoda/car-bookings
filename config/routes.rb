Rails.application.routes.draw do
	resource :session
  resources :users
  root "cars#index"
  resources :cars do 
  	resources :reviews
  end
  get 'signup' => 'users#new'
end
