# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :accounts, only: %i[create show]
  end
  root 'home#index'
end
