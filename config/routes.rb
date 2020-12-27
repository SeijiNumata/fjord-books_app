Rails.application.routes.draw do
  get 'users/show'
  get '/' => redirect('/books')
  devise_for :users
  get '/mypage' => 'users#mypage'
  resources :users, only: [:show,:index,:edit, :update]
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
