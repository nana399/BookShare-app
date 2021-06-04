Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get 'books/booksearch', to: 'books#new'
  root 'books#index'
  resources :books do
    resources :likes, only: [:create, :destroy]
  end
 
end
