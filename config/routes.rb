# frozen_string_literal: true

Rails.application.routes.draw do
  get 'discussions/index'
  devise_for :users

  root to: 'main#index'

  resources :discussions, only: %i[index new create]
end
