Rails.application.routes.draw do
  mount ReportsKit::Engine, at: '/'

  root to: 'pages#index'

  resources :categories, only: [:show], param: :key do
    resources :subcategories, only: [:show], param: :key do
      resources :examples, only: [:show], param: :key
    end
  end
  resources :pages, only: [:index]
end
