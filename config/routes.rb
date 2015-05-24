Rails.application.routes.draw do
  resources :recipes, only: [:show]

  resources :restaurants do
    resources :dishes, only: [:show]
    collection do 
      get "get_zip"
      post "get_zip"
    end
  end

 
  root 'restaurants#index'
end
