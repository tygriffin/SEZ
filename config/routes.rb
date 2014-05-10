SEZWebsite::Application.routes.draw do

  root :to => 'sez_core#index'

  match '/about', :to => 'sez_core#about', :via => :get

  match '/archive', :to => 'sez_core#archive', :via => :get

  match '/contribute', :to => 'sez_core#contribute', :via => :get

  match '/contact' => 'contact#new', :as => 'contact', :via => :get
  #match '/contact' => 'contact#create', :as => 'contact', :via => :post

  match '/game/:id', :to => 'sez_core#game', :as => :game, :via => :get

  resources :article
  resources :vocabulary_word
  resources :culture_note
  resources :tag
  resources :topic
  resources :quizzes
  resource :quiz
  match '/feed' => 'article#feed', :as => :feed, :defaults => { :format => 'rss' }, :via => :get

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

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
