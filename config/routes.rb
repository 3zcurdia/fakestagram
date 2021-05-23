# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    namespace :v1 do
      resource :fake, only: :show
      post :sign_up, to: 'users#create'
      post :sign_in, to: 'sessions#create'
      namespace :posts do
        get :near, to: 'near#index'
      end
      resources :posts do
        resources :comments
      end
      resource :profile, only: %i[show update]
      namespace :profile do
        resources :posts, only: :index
      end
    end
  end
end
