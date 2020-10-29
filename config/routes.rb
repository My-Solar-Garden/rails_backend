Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :gardens do
          resources :sensors do
          end
        end
      end
    end
  end
end
