Rails.application.routes.draw do
  get 'recetas/new'
  get 'recetas/edit'
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'user#new'
  post 'signup', to: 'user#create'
  get 'show', to: 'user#show'

  get 'password/reset', to: 'password_reset#new'
  post 'password/reset', to: 'password_reset#create'
  get 'password/reset/edit', to: 'password_reset#edit'
  patch 'password/reset/edit', to: 'password_reset#update'

  get 'recetas/crear_receta', to: 'recetas#new'
  post 'recetas/crear_receta', to: 'recetas#create'

  root 'home#index'
  get 'about', to: "home#about"
end
