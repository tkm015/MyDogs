Rails.application.routes.draw do
  namespace :public do
    devise_for :customers
    root 'customers#top'
    resources :customers, onry: [:show, :edit, :update]
  end

  namespace :admin do
    devise_for :admins
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
