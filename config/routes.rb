Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "articles#index"
  resources :articles do
    get :usershow, on: :member
    get :search, on: :collection
    resources :comments, only: [:create]
  end
  resources :users, only: [:index]
  # get '/articles/search', to:'articles#search'

end
