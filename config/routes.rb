Rails.application.routes.draw do
  root 'main#index'
  resources :sponsors
  resources :articles
  resources :comments
  resources :replies

  get 'main/index'
  get 'tags/:tag', to: 'articles#index', as: :tag

  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
end
