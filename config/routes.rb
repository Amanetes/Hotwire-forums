# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  devise_for :users

  unauthenticated do
    root to: 'main#index', as: :unauthenticated_root
  end

  authenticated do
    root to: 'discussions#index'
  end

  resources :discussions do
    resources :posts, only: %i[create show edit update destroy], module: :discussions

    collection do
      get 'category/:id', to: 'categories/discussions#index', as: :category
    end

    resources :notifications, only: :create, module: :discussions
  end

  resources :notifications, only: :index do
    collection do
      post '/mark_as_read', to: 'notifications#read_all', as: :read
    end
  end
end
