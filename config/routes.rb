Rails.application.routes.draw do
  

  get 'posts/index'

  devise_for :users
  resources :tasks
  root 'welcome#index'
  post 'users/create' => "users#create",:as => :create_user
  resources :users do
    member do
      put :update_block
      put :update_unblock
    end
  end
  resources :home, :only=>[:index]
  resources :profiles
  resources :status 
 resources :posts
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end

