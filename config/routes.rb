Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
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
      resources :sensors do
        get :garden_healths, to: 'sensors/garden_healths#index'
        get '/garden_healths/last', to: 'sensors/garden_healths#last'
      end
    end
  end
end
