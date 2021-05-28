Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    resources :likes, only: [:create, :destroy]
    root 'books#index'
    get '/search_path', to: 'books#search'
  end
 
end
