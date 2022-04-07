Rails.application.routes.draw do
  root 'todo#list'
  get '/todos', to: 'todo#list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
