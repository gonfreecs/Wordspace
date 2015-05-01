  Rails.application.routes.draw do

    root 'articles#index'
    # user controls
    get 'users/controls' => 'users#controls', :as => :controls

    resources :ads
    resources :articles
    resources :comments
    resources :replies

    mount RedactorRails::Engine => '/redactor_rails'
    devise_for :users

    resources :users, only: :show

    resources :users, only: [:follow, :unfollow] do
    member do
      put 'follow' => 'users#follow'
      put 'unfollow' => 'users#unfollow'
    end
  end

  resources :magazines do
      collection do
        get 'leave'
      end
    end

    resources :bids do
      collection do
        get 'destroy'
      end
    end
   # adding resources
    resources :sponsors do
      collection do
        get 'control'
        get 'delete'
      end
    end


    resource :articles do
      collection do
        get 'bid'
      end
    end

    resources :collaboration_invitations do
      collection do
        get 'check_for_approve'
        get 'check_for_reject'
      end
    end

    # Search url matching
    get '/search' => 'search#search'
    get 'tags/:tag', to: 'articles#index', as: :tag
    get 'categories/:category', to: 'articles#index', as: :category
    get 'main/index'
  end
