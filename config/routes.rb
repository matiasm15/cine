# frozen_string_literal: true

require 'sidekiq/web'

Sidekiq::Web.set :session_secret, Rails.application.secrets.secret_key_base

if Rails.env.production?
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    secrets = Rails.application.secrets

    secure_compare_username = ActiveSupport::SecurityUtils.secure_compare(secrets.sidekiq_username, username)
    secure_compare_password = ActiveSupport::SecurityUtils.secure_compare(secrets.sidekiq_password, password)

    secure_compare_username && secure_compare_password
  end
end

Rails.application.routes.draw do
  devise_for :users

  post '/auth', to: 'authentication#auth'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :functions, except: [:new, :edit]
  resources :movies, except: [:new, :edit]
  resources :movie_versions, except: [:new, :edit]
  resources :tickets, only: [:index, :show, :update]

  resources :cinemas, only: [:index, :show]
  resources :classifications, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :languages, only: [:index, :show]
  resources :seats, only: [:index]

  root 'root#root'
end
