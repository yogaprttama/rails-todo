Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "todos#index"
  resources :todos
  post "todos/:id/toggle", to: "todos#toggle"
end
