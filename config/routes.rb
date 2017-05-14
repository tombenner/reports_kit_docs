Rails.application.routes.draw do
  mount ReportsKit::Engine, at: '/'

  root to: 'visitors#index'

  resources :examples, only: [:index, :show], param: :key
end
