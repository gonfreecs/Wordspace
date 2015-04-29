Rails.application.routes.draw do
  root 'articles#index'
  resources :magazines
  # adding resources
  resources :comments
  resources :replies
  get 'tags/:tag', to: 'articles#index', as: :tag
  get 'categories/:category', to: 'articles#index', as: :category

  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
  get 'main/index'
  # Search url matching
  get '/search' => 'search#search'

    resources :ads
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
    resources :articles
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
  end

