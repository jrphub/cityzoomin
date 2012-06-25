Cityzoomin::Application.routes.draw do
  #SSL_PROTO__ = 'https' unless defined?(SSL_PROTO__)
  resources :users
  #scope :constraints => { :protocol => 'https' } do
   # resources :users do
    # resources :create
    #end
  #end
  resources :microposts do
    member do
      post :vote_up
      post :vote_down
      post :comment_create
    end
  end
  resources :comments
  resources :locations
  resources :forgotpasswords
  resources :sessions, only: [:new, :create, :destroy]
  #scope :constraints => { :protocol => 'https' } do
   # resources :sessions do
   # resources :create
    #end
  #end
  root :to => 'pages#home'
  
  match '/image_wall', to: 'users#image_wall'
  match '/microposts/new', to: 'microposts#new'
  match '/signup',  to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  match '/pages/sendFeedback', to: 'pages#sendFeedback'
  match '/pages/sendContact', to: 'pages#sendContact'
  match '/pages/result', to: 'pages#result'
  match '/fplast', to: 'pages#fplast'
  match '/forgot_password', to: 'pages#forgot_password'
  match '/home', to: 'pages#home'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
