Rails.application.routes.draw do
  root 'articles#index'
  resources :sponsors
  resources :articles
  resources :comments
  resources :replies
  get 'tags/:tag', to: 'articles#index', as: :tag
  get 'categories/:category', to: 'articles#index', as: :category

  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
  get 'main/index'
  # Search url matching
  get '/search' => 'search#search'
end
