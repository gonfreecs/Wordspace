
      Rails.application.routes.draw do
        resources :magazines do
          member do
            put 'follow' => 'magazines#follow'
            put 'unfollow' => 'magazines#unfollow'
            put 'invite' => 'magazines#invite'
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
