Rails.application.routes.draw do
  get 'sessions/new'

  resources :recipes, only: [:show, :index, :create]

  resources :restaurants do
    resources :dishes, only: [:show]
    collection do 
      get "get_zip"
      post "get_zip"
    end
  end

  get '/sign-up', to: 'users#new'
  post '/sign-up', to: 'users#create'

  post '/favorites', to: 'recipes#create'
  get '/favorites', to: 'recipes#favorites'
  get '/youtube', to: 'recipes#youtube'

  get '/sign-in', to: 'sessions#new'
  post '/sign-in', to: 'sessions#create'
  delete '/sign-out', to: 'sessions#destroy', as: 'sign_out'

 
  root 'restaurants#index'
end
