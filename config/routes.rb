# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resources :movies, only: %i[index show]
  resource :about, only: %i[show]

  root 'home#index'
end
