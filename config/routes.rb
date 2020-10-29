Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # Sensors
      get '/users/:id/gardens/:id/sensors', to: 'sensors#index'
      get '/users/:id/gardens/:id/sensors/:id', to: 'sensors#show'
      post '/users/:id/gardens/:id/sensors', to: 'sensors#create'
      patch '/users/:id/gardens/:id/sensors/:id', to: 'sensors#update'
      delete '/users/:id/gardens/:id/sensors/:id', to: 'sensors#delete'
    end
  end
end
