Rails.application.routes.draw do
  resources :articles
  resources :users, defaults: { format: :json }
  get "homes/index"
  # get 'users/index'
end
