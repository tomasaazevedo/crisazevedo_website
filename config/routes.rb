Rails.application.routes.draw do
  resources :highlights
  resources :sub_collection_images
  resources :collection_images
  resources :product_images
  resources :products
  resources :sub_collections
  resources :collections
  root 'home#index'

  get 'signup'  => 'users#signup'
  post 'signup' => 'users#signup_post' 
  get '/users' => 'users#index'
  get '/users/new' => 'users#new', as: 'new_user'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  put '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get '/products/destroy_image/:id' => 'products#destroy_image'
  get '/collections/destroy_image/:id' => 'collections#destroy_image'
  get '/sub_collections/destroy_image/:id' => 'sub_collections#destroy_image'

  get '/show_collections' => 'collections#show_all_collections', as: 'show_collections'
  get '/show_collections/:id' => 'collections#show_collection'

  get '/show_products' => 'products#show_all_products', as: 'show_all_products'
  get '/show_products/:type' => 'products#show_products_by_type', as: 'show_products_by_type'

  # The priority is based upon order of creation: first created -> highest priority.
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
end
