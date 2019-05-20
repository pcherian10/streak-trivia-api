Rails.application.routes.draw do

  namespace :api do
    namespace :v2 do
          resources :users do
            resources :questions, only: [:index, :show, :create, :destroy]
            resources :attempts, only: [:create, :index, :show]
            resources :streaks, only: [:create, :update, :show, :index]
          end
        end
      end


end
