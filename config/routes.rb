Rails.application.routes.draw do
  resources :tracks
  resources :genres
  resources :dpas
  resources :artists
  root "artists#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
