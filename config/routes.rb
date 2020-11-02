Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/garden_healths/search', to: 'search#index'
      resources :plants
      resources :garden_healths
      resources :users
      resources :gardens do
        get :sensors, to: "gardens/sensors#index"
      end
      resources :sensors
    end
  end
end
