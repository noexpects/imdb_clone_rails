# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :movies
    resources :categories
    resources :movie_photos
    resources :reviews

    root to: 'users#index'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resources :movies, only: %i[index show]
  resource :about, only: %i[show]
  resource :review, only: %i[create]
  resources :categories, only: %i[show]

  root 'home#index'
end
