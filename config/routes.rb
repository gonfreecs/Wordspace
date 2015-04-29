Rails.application.routes.draw do
  # adding resources
  get 'users/reports' => 'users#reports', :as => :reports
  get 'users/banned_users' => 'users#banned_users', :as => :banned_users
  resources :sponsors
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
  # adding resources
  resources :magazines
  resources :articles
  resources :comments
  resources :replies
  resources :collaboration_invitations do
    collection do
      get 'check_for_approve'
      get 'check_for_reject'
    end
  end
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
  get 'main/index'
  root 'main#index'
  # resources :moderators
  resources :users
  resources :articles

  # mohab
  # 1.4.2015
  # route to profile
  resources :users, only: :show
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
  # Search url matching
  get '/search' => 'search#search'

# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'

# Example of regular route:
#   get 'products/:id' => 'catalog#view'

# Example of named route that can be invoked with purchase_url(id: product.id)
#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

# Example resource route
# (maps HTTP verbs to controller actions automatically):
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
end
