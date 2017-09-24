Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  resources :main, only: [:index]
  post '/auth/developer/callback', to: 'sessions#create'
  post '/auth/facebook/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
end
