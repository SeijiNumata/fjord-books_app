Rails.application.routes.draw do
  root "users#index"
  get 'users/show'
  devise_for :users
  resources :users, :only => [:index,:show]
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
