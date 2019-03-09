# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :accounts, only: %i[create show]
    resources :posts do
      resources :likes, only: %i[index create destroy]
    end
  end
  root 'home#index'
end
