Rails.application.routes.draw do
  mount ReportsKit::Engine, at: '/'

  root to: 'categories#index'

  resources :categories, only: [:index, :show], param: :key do
    resources :examples, only: [:show], param: :key
  end
end
