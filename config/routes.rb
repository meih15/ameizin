Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'api/test', to: 'application#test'

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create, :show]
    resource :session, only: [:show, :create, :destroy]
    resources :categories, only: [:show, :index]
    resources :products, only: [:index, :show, :update]
    resource :cart, only: [:show]
    resources :cart_items, only: [:index, :show, :create, :update, :destroy]
    resources :order_history_items, only: [:index, :show, :create, :destroy]
    resources :reviews, only: [:index, :show, :create, :destroy, :update]
  end


  get '*path', to: "static_pages#frontend_index"
end
