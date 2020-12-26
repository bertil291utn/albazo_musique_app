Rails.application.routes.draw do
  resources :networks
  resources :genres
  resources :dpas
  resources :artists do
    resources :tracks
  end
  post "genero_artistas", to: "genres#genero_artistas"
  root "genres#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
