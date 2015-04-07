Rails.application.routes.draw do
  resources :magazines
  resources :magazines do
    member do
      get 'join'
    end
  end
  resources :magazines do
    member do
      get 'showrequests'
    end
  end
  resources :magazines do
    member do
      get 'approverequest'
    end
  end

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
