Rails.application.routes.draw do
  mount ReportsKit::Engine, at: '/'

  root to: 'pages#index'

  resources :categories, only: [:show], param: :key
  resources :subcategories, only: [:show], param: :key
  resources :examples, only: [:show], param: :key
  resources :pages, only: [:index]
end
