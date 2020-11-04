Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'weather#show'
      get '/garden_healths/search', to: 'search#index'
      namespace :plants do
        get '/search', to: 'search#index'
      end
      resources :plants
      resources :garden_healths
      resources :users
      resources :gardens do
        get :sensors, to: "gardens/sensors#index"
      end
      namespace :gardens do
        post '/:id/plants', to: 'plants#create'
      end
      resources :gardens
      resources :sensors
    end
  end
end
