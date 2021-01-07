Rails.application.routes.draw do
  resources :reviews, except: [:edit, :update] do 
    resources :likes
    resources :comments
  end
  resources :places, only: [:index, :show]
  resources :users, except: [:index, :destroy]
  resources :contacts, only: [:index]

  get "/sessions/new", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#logout" , as: "logout"

  delete "/users/:id/remove_image", to: "users#remove_image", as: "remove_image"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
