Rails.application.routes.draw do

  resources :reviews, except: [:edit, :update]
  resources :places, only: [:index, :show]
  resources :users, except: [:index, :destroy]

  get "/sessions/new", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create"

  # delete "/log_out", to: "sessions#log_out", as: "log_out"
#corrected the log_out route

  delete "/logout", to: "sessions#logout" 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
