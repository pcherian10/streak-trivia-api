Rails.application.routes.draw do

  namespace :api do
    namespace :v2 do
          resources :users do
            get '/question', to: 'questions#question' #custom route that pulls out a suitable question for user
            get '/current_streak', to: 'streaks#current_streak'
            resources :questions, only: [:index, :show, :create, :destroy]
            resources :attempts, only: [:create, :index, :show]
            resources :streaks, only: [:create, :update, :show, :index]
            resources :stats
          end
          post '/auth', to: 'auth#create'
          get '/current_user', to: 'auth#show'
        end
      end


end
