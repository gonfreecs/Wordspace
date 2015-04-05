Rails.application.routes.draw do
  resources :magazines

  # adding resources
  resources :sponsors
  resources :articles
  resources :comments
  resources :replies
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
  get 'main/index'
  root 'main#index'
  resources :articles
end
