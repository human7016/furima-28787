Rails.application.routes.draw do
  root to: 'items#index'
  resources :items do
    resources :purchase_histories, only: :index
  end 
  devise_for :users
end
