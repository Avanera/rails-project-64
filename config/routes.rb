# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :posts do
    resources :comments, shallow: true, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end
end
