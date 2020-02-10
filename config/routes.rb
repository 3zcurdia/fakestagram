# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :sign_up, to: 'users#create'
      resources :posts do
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
