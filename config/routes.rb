Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :categories
  resources :related_accounts
  resources :accounts
  resources :notes
  get 'pages/home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'
  
  resources :accounts do
    resources :notes
  end
  
  get '/cash_accounts' => 'accounts#cash_accounts'
  get '/bank_accounts' => 'accounts#bank_accounts'
  get '/credit_cards' => 'accounts#credit_cards'
  get '/bills' => 'accounts#bills'
  
  #get  '/signup' => 'users#new'
  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
    
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
