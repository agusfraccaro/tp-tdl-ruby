Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/show'
  get 'comments/create'
  get 'cookpedia', to: 'cookpedia#index'  

  # get 'cookpedia/nueva_receta', to: 'recipe#new'
  post 'recipe/new', to: 'recipe#create'
  patch 'recipe/:id/edit', to: 'recipe#update'
  # get 'mis_recetas', to: 'recipe#index'
  # delete 'mis_recetas/:id', to: 'recipe#destroy'
  # get 'cookpedia/edit_receta', to: 'recipe#edit'
  # post 'cookpedia/edit_receta', to: 'recipe#update'
  # delete 'cookpedia/mis_recetas', to: 'recipe#destroy'

  resources :recipe do
    resources :comments
  end

  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'user#new'
  post 'signup', to: 'user#create'
  get 'perfil', to: 'user#show'
  get 'perfil/edit', to: 'user#edit'
  post 'perfil/edit', to: 'user#update'

  get 'password/reset', to: 'password_reset#new'
  post 'password/reset', to: 'password_reset#create'
  get 'password/reset/edit', to: 'password_reset#edit'
  patch 'password/reset/edit', to: 'password_reset#update'

  root 'home#index'
  get 'about', to: "home#about"
end
