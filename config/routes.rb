# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :accounts, only: :create
      resources :posts do
        resource :like, only: %i[create destroy]
        resources :likes, only: :index
        resources :comments
      end
      resource :profile, only: %i[show update]
      namespace :profile do
        resources :posts, only: :index
      end
    end
  end
  root 'home#index'
end
