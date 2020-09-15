Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'posts#index' 
  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
    member do
      get 'search'
    end
  end
  resources :users, only: [:show]
  
  # get 'posts' => 'posts#index'
  # get 'posts/new'  =>  'posts#new' 
  # post  'posts'      =>  'posts#create' 
  # get   'users/:id'   =>  'users#show'
  # get   'pots/:id/edit'  => 'posts#edit'
  # patch   'posts/:id'  => 'posts#update'
  # delete  'posts/:id'  => 'posts#destroy'
  # get 'posts/:id' => 'posts#show'
end
