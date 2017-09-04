
Rails.application.routes.draw do


  namespace :api do 
    namespace :v1 do  

      root "auth#ping"
      resources :users, only: [:create, :show, :index] 
      resources :decisions

      # /api/v1/auth
      post '/auth', to: "auth#login"
      post '/auth/refresh', to: "auth#refresh"

      # /api/v1/carts 
      
    end
  end
end