Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "todo_lists#index"

  resources :sessions, only: [:new, :create, :destroy]

  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  
  resources :todo_lists do
    resources :todo_items, only: [:show, :new, :edit, :update, :create, :destroy]
  end
end
