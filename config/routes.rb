Rails.application.routes.draw do
  root 'pages#index'
  resources:users

  get '/login', to: "users#login"
  post '/resoult', to: "users#resoult"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
