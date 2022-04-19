Rails.application.routes.draw do
  root to: 'private#index'

  get 'user/new'
  post 'user/create'

  get 'session/login'
  post 'session/create'
  get 'session/logout'
end
