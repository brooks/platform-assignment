Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show]
  post 'users/search', to: 'users#search', as: 'users_search'
end
