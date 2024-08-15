# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  scope "/:locale" do
    resources :posts do
      resources :comments, shallow: true, only: %i[create destroy]
      resources :likes, shallow: true, only: %i[create destroy]
    end
  end
end
