Rails.application.routes.draw do
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :new, :create]     
  end 
  devise_for :users
end
