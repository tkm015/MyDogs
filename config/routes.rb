Rails.application.routes.draw do
  root 'public/customers#about'
  namespace :public do
    devise_for :customers
    get '/top', to: 'customers#top', as: "top"
    resources :customers, only: [:show, :edit, :update]
    put '/customers/:id/hide', to: 'customers#hide', as: 'destroy'
    resources :rooms, only: [:create, :show]
    resources :messages, only: [:create, :destroy]
    resources :dogs, only: [:new, :create, :show, :edit, :update, :destroy]
    get '/posts/newimage', to: 'posts#newimage', as: "newimage"
    get '/posts/newvideo', to: 'posts#newvideo', as: "newvideo"
    resources :posts, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :relationships, only: [:create, :destroy]
    get '/followers', to: 'relationships#followers', as: "followers"
    get '/follows', to: 'relationships#follows', as: 'follows'
    resources :notifications, only: :index
    get '/notification', to: 'notifications#hide', as: 'hide'
    get '/search', to: 'search#search'
  end

  namespace :admin do
    devise_for :admins
    resources :dog_breeds, only: [:index, :create, :destroy]
    resources :customers, only: [:index, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
