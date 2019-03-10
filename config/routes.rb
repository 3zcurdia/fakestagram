# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :accounts, only: %i[create show]
    resources :posts do
      resource :like, only: %i[create destroy]
      resources :likes, only: :index
      resources :comments
    end
    resource :profile, only: :show
    namespace :profile do
      resources :posts, only: :index
    end
  end
  root 'home#index'
end
