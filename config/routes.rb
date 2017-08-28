Rails.application.routes.draw do
  mount ReportsKit::Engine, at: '/'

  default_category = Category.first
  root to: 'categories#show', key: default_category.key

  resources :categories, only: [:show], param: :key do
    resources :subcategories, only: [:show], param: :key do
      resources :examples, only: [:show], param: :key
    end
  end
end
