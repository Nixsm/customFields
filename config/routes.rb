Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  root 'sessions#new'

  resources :users do
    resources :custom_fields
    resources :contacts
  end
end
