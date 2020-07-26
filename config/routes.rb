Rails.application.routes.draw do
  namespace :public do
    devise_for :customers
    root 'customers#top'
    resources :customers, onry: [:show, :edit, :update]
    resources :dogs, onry: [:new, :create, :show, :edit, :update, :destroy]
    get '/posts/newimage' => 'posts#newimage', as: "newimage"
    get '/posts/newvideo' => 'posts#newvideo', as: "newvideo"
    resources :post, onry: [:index, :show, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    devise_for :admins
    resources :dog_breeds, onry: [:index, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
