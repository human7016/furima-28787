Rails.application.routes.draw do
  root to: 'items#index'
  resources :orders, only: :index do
    resources :purchase_historyories, only: :create
  end 
  devise_for :users
end
