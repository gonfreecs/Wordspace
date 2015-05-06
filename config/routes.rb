  Rails.application.routes.draw do
    root 'articles#index'
    resources :payments
    # user controls
    get 'users/controls' => 'users#controls', :as => :controls
    get 'users/reports' => 'users#reports', :as => :reports
    get 'users/banned_users' => 'users#banned_users', :as => :banned_users
    get 'sponsors/control' => 'sponsors#control', :as => :control
    resources :ads
    resources :articles
    resources :magazines do
      collection do
        get 'removeco'
      end
    end
    resources :comments
    resources :replies
    resources :sponsors
    # resources :users

    mount RedactorRails::Engine => '/redactor_rails'
    devise_for :users

    # Author: Mayar
    # Date: 28.4.2015
    # adding route
    resources :users do
      collection do
        get 'mymagazines'
      end
    end

    resources :users, only: :show

    resources :users, only: [:follow, :unfollow] do
      member do
        put 'follow' => 'users#follow'
        put 'unfollow' => 'users#unfollow'
      end
    end

    resources :bids do
      collection do
        get 'destroy'
      end
    end

    resources :sponsors do
      collection do
        get 'control'
        get 'delete'
      end
    end

    resources :articles do
        member do
          put 'like' => 'articles#upvote'
          put 'unlike' => 'articles#downvote'
        end
      end
      # follow and unfollow a magazine
    resources :magazines do
          member do
            put 'follow' => 'magazines#follow'
            put 'unfollow' => 'magazines#unfollow'
            get 'invite' => 'magazines#invite'
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

    resources :articles do
      member do
        get 'report'
        get 'dismiss'
      end
    end
    resources :users do
      member do
        get 'reports'
        get 'banned_users'
        get 'ban'
        get 'unban'
        get 'dismiss_article'
        get 'dismiss_comment'
      end
    end
    # specifying route for report action in comment controller
    resources :comments do
      member do
        get 'report'
        get 'dismiss'
      end
    end

    # Search url matching
    get '/search' => 'search#search'
    get 'tags/:tag', to: 'articles#index', as: :tag
    get 'categories/:category', to: 'articles#index', as: :category
    get 'main/index'
  end

# The priority is based upon order of
# creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'

# Example of regular route:
#   get 'products/:id' => 'catalog#view'

# Example of named route that can be invoked with purchase_url(id: product.id)
#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

# Example resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Example resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Example resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Example resource route with more complex sub-resources:
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', on: :collection
#     end
#   end

# Example resource route with concerns:
#   concern :toggleable do
#     post 'toggle'
#   end
#   resources :posts, concerns: :toggleable
#   resources :photos, concerns: :toggleable

# Example resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end
