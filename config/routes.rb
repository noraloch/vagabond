Rails.application.routes.draw do
<<<<<<< HEAD
  resources :reviews, except: [:edit, :update] do 
    resources :likes
  end
=======

>>>>>>> noura
  resources :places, only: [:index, :show]
  resources :users, except: [:index, :destroy]

  get "/sessions/new", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create"
<<<<<<< HEAD
  # put "review/:id/like", to: "reviews#like", as: "like"
=======

  # delete "/log_out", to: "sessions#log_out", as: "log_out"
#corrected the log_out route

  delete "/logout", to: "sessions#logout" , as: "logout"

>>>>>>> noura
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
