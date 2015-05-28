Rails.application.routes.draw do
  resources :recipes, only: [:show, :index]

  resources :restaurants do
    resources :dishes, only: [:show]
    collection do 
      get "get_zip"
      post "get_zip"
    end
  end

 
  root 'home#index'
end
