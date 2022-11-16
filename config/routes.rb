Rails.application.routes.draw do
  get 'cookpedia', to: 'cookpedia#index'  

  post 'recipe/new', to: 'recipe#create'
  patch 'recipe/:id/edit', to: 'recipe#update'

  resources :recipe do
    resources :comments
  end

  post "/recipes/:id/like", to: "recipe#like", as: "like"
  delete "/recipes/:id/like", to: "recipe#unlike", as: "unlike"

  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'password/reset', to: 'password_reset#new'
  post 'password/reset', to: 'password_reset#create'
  get 'password/reset/edit', to: 'password_reset#edit'
  patch 'password/reset/edit', to: 'password_reset#update'

  root 'home#index'
  get 'about', to: "home#about"
end
