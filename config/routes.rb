Rails.application.routes.draw do
  resources :recipes, only: [:show]


  resources :restaurants, only: [:index, :show] do
    resources :dishes, only: [:show]
  end

  root 'restaurants#index'
end
