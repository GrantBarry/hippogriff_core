Rails.application.routes.draw do
  draw :addresses
  resources :accounts do
    resources :agents
    resources :properties
    resources :property_commercial,  type: 'Property::Commercial',  only: %i[create update]
    resources :property_industrial,  type: 'Property::Industrial',  only: %i[create update]
    resources :property_residential, type: 'Property::Residential', only: %i[create update]
    resources :property_retail,      type: 'Property::Retail',      only: %i[create update]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'accounts#index'
end
