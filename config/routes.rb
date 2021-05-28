Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    resources :likes, only: [:create, :destroy]
    root 'books#index'
    get '/books/:id/book_search', to: 'books#google_search'
  end
 
end
