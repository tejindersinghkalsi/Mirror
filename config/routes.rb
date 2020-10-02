Rails.application.routes.draw do
  resources :feedbacks
  devise_for :admins
  resources :words
  resources :communities
  resources :years
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :stories
  resources :targets
  root "welcome#welcome" 
  
  get 'docipedias/', to: 'docipedias#index', as: 'index'

  resources :conversations do
   resources :messages
  end

  


  get 'home/' => 'home#home', as: 'home'
  get 'groupnew/' => 'targets#groupnew', as: 'groupnew'


   get 'aroundme/' => 'topics#aroundme', as: 'aroundme'
   get 'technology/' => 'topics#technology', as: 'technology'
   get 'travel/' => 'topics#travel', as: 'travel'
   get 'food/' => 'topics#food', as: 'food'
   get 'career/' => 'topics#career', as: 'career'
   get 'examination/' => 'topics#examination', as: 'examination'

 

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
