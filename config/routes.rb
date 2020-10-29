Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :gardens do
          # Sensors
          get '/sensors', to: 'sensors#index'
          get '/sensors/:id', to: 'sensors#show'
          post '/sensors', to: 'sensors#create'
          patch '/sensors/:id', to: 'sensors#update'
          delete '/sensors/:id', to: 'sensors#delete'
        end
      end
    end
  end
end
