Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes do
    get '/resize', to: 'recipes#resize', as: 'resize'
    resources :doses
    resources :ingredients
    resources :instructions
    resources :wishlist_items
  end
  resources :wishlists
end
