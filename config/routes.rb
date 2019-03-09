# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :accounts, only: %i[create show]
    resources :posts
  end
  root 'home#index'
end
