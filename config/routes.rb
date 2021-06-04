Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :books do
    resources :likes, only: [:create, :destroy]
    root 'books#index'
    get '/booksearch', to: 'books#new'
  end
 
end
