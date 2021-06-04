Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get 'books/booksearch', to: 'books#new'
  resources :books do
    resources :likes, only: [:create, :destroy]
    root 'books#index'
  end
 
end
