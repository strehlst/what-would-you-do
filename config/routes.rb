# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dreams#index'
  resources :dreams, only: %i[index show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
