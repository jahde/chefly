Rails.application.routes.draw do
  resources :recipes

  resources :dishes

  resources :restaurants

  root 'restaurants#index'
end
