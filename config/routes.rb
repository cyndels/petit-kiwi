Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # routes for one recipe
  resources :recipes, path: 'recettes' do
    get '/redimensionner', to: 'recipes#resize', as: 'resize'
    resources :doses, path: 'ingredients'
    resources :items, except: :destroy, path: 'ajouter-item'
    resources :ingredients
    resources :instructions
  end
  resources :wishlists, path: 'wishlists' do
    resources :items, only: :destroy, path: 'supprimer-item'
  end
end
