# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#frontpage'

  devise_for :users, controllers: { registrations: 'registrations' }
  get 'user/dreams', to: 'users#dreams'
  resources :users, only: %i[show]
  resources :dreams, only: %i[index show new create]
  get 'dreams/:id/embrace', to: 'dreams#embrace', as: 'embrace_dream'
  delete 'dreams/:id/disembrace', to: 'dreams#disembrace', as: 'disembrace_dream'
  get 'about', to: 'pages#about', as: 'pages_about'
  get 'contact', to: 'pages#contact', as: 'pages_contact'
  get 'static/not-found', to: 'pages#not_found', as: 'pages_not_found'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
