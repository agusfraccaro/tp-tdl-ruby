Rails.application.routes.draw do
  get 'search', to: 'search#index'
  resources :tags
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

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  root 'home#index'
  get 'about', to: "home#about"
end
