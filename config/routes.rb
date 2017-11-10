Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :categories
  resources :related_accounts
  resources :accounts
  # update notes routes so url shows transactions instead of notes
  resources :notes
  get '/home' => 'pages#home'
  get 'summary' => 'pages#summary'
  get 'budget' => 'pages#budget'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'notes#index'
  
  resources :accounts do
    resources :notes
  end
  
  get '/cash_accounts' => 'accounts#cash_accounts'
  get '/bank_accounts' => 'accounts#bank_accounts'
  get '/credit_cards' => 'accounts#credit_cards'
  get '/bills' => 'accounts#bills'
  get '/loans' => 'accounts#loans'
  
  #get  '/signup' => 'users#new'
  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  get   '/logout' => 'sessions#destroy'
    
end
