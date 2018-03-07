# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'dreams#new'
  resources :dreams, only: %i[index show new create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
