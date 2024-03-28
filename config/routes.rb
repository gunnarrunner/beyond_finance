Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :tradelines, only: [:index, :show] do
        resources :deposits, only: :create
      end
    end
  end
end
