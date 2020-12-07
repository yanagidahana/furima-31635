Rails.application.routes.draw do
  get 'comment/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :records 
    resources :comments, only: [:create]
  end
end
 