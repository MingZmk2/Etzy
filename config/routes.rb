Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create]
    resources :products, only: [:index, :show]
    resources :cart, only: [:create, :index, :show, :update, :destroy]
    resources :reviews, only: [:create, :index, :show, :update, :destroy]
    # resources :categories, only: [:create] #bonus feature will add later
    resource :session, only: [:create, :show, :destroy]
  end

  get '*path', to: "static_pages#frontend_index"

end
