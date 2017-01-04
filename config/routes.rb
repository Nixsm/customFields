Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/login', to: "sessions#destroy"

  resources :users do
    resources :fields
    resources :contacts
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
