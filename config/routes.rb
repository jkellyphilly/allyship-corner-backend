Rails.application.routes.draw do
  resources :comments
  resources :events
  resources :users, only: [:create, :index]
  post '/login', to: 'auth#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
