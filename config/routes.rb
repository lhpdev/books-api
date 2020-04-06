Rails.application.routes.draw do
  namespace :api do
    resources :books, only: [:index, :show, :create, :destroy]
    resources :collections, only: [:show]
  end
end
