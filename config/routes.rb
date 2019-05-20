Rails.application.routes.draw do

  namespace :api do
    namespace :v2 do
          resources :users do
            resources :questions, except: [:edit]
            resources :attempts, except: [:edit]
            resources :streaks, except: [:edit]
          end
        end
      end


end
