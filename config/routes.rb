Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users
  resources :users
  resources :fukus do
    resources :likes, only:[:create, :destroy]
  end
end
