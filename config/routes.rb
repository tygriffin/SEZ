SEZWebsite::Application.routes.draw do

  root :to => 'sez_core#index'

  get '/about'       => 'sez_core#about'
  get '/archive'     => 'sez_core#archive'
  get '/contribute'  => 'sez_core#contribute'
  get '/contact'     => 'contact#new',         :as => 'contact'
  #match '/contact'  => 'contact#create',      :as => 'contact'
  get '/game/:id'    => 'sez_core#game',       :as => 'game'
  get '/feed'        => 'article#feed',        :as => :feed,    :defaults => { :format => 'rss' }

  resources :article
  resources :vocabulary_word
  resources :culture_note
  resources :tag
  resources :topic
  resources :quizzes
  resource :quiz

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end

