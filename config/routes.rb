Rails.application.routes.draw do
  namespace :public do
    devise_for :customers
    root 'customers#top'
    resources :customers, only: [:show, :edit, :update]
    resources :rooms, only: [:index, :create, :show]
    resources :messages, only: [:create, :destroy]
    resources :dogs, only: [:new, :create, :show, :edit, :update, :destroy]
    get '/posts/newimage' => 'posts#newimage', as: "newimage"
    get '/posts/newvideo' => 'posts#newvideo', as: "newvideo"
    resources :posts, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get '/search', to: 'search#search'
  end

  namespace :admin do
    devise_for :admins
    resources :dog_breeds, only: [:index, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
