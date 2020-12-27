Rails.application.routes.draw do
  get 'users/show'
  get '/' => redirect('/books')
  devise_for :users
  resources :users, only: [:show,:index]
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
