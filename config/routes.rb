SEZWebsite::Application.routes.draw do

  root :to => 'sez_core#index'

  get  '/about'       => 'sez_core#about'
  get  '/archive'     => 'sez_core#archive'
  get  '/contribute'  => 'sez_core#contribute'
  get  '/contact'     => 'contacts#new',         :as => 'contact'
  post '/contact'     => 'contacts#create',      :as => 'contact_create'
  get  '/game/:id'    => 'sez_core#game',        :as => 'game'
  get  '/feed'        => 'articles#feed',        :as => :feed,    :defaults => { :format => 'rss' }

  resources :articles
  resources :topics
  resources :quizzes

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end

