Rails.application.routes.draw do
  get 'cookpedia', to: 'recipe#index'
  get 'cookpedia/nueva_receta', to: 'recipe#new'
  post 'cookpedia/nueva_receta', to: 'recipe#update'
  get 'cookpedia/mis_recetas', to: 'recipe#show'

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

  root 'home#index'
  get 'about', to: "home#about"
end
