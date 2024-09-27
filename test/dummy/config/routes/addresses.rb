resources :countries do
  resources :states do
    resources :cities
  end
end
