Rails.application.routes.draw do
  root "homes#index"
  resources :articles
  resources :users, defaults: { format: :json }
end
