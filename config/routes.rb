Rails.application.routes.draw do
  resources :reviews, except: [:edit, :update] do 
    resources :likes
  end
  resources :places, only: [:index, :show]
  resources :users, except: [:index, :destroy]
  get "/sessions/new", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create"
  delete "/log_out", to: "sessions#log_out", as: "log_out"
  # put "review/:id/like", to: "reviews#like", as: "like"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
