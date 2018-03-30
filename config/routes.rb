# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#frontpage'

  devise_for :users, controllers: { registrations: 'registrations' }
  get 'user/dreams', to: 'users#dreams'
  resources :users, only: %i[show edit update] do
    patch 'avatar', to: 'users#update_avatar'
    resources :embraces
  end

  resources :dreams, only: %i[index show new create] do
    resources :embraces
  end
  get 'dreams/:id/embrace', to: 'dreams#embrace', as: 'embrace_dream'
  delete 'dreams/:id/disembrace', to: 'dreams#disembrace', as: 'disembrace_dream'
  get 'about', to: 'pages#about', as: 'pages_about'
  get 'calendar', to: 'pages#calendar', as: 'pages_calendar'
  get 'contact', to: 'pages#contact', as: 'pages_contact'
  get 'articles', to: 'pages#articles', as: 'pages_articles'
  get 'static/not-found', to: 'pages#not_found', as: 'pages_not_found'

  match '*path', to: 'pages#not_found', via: %i[get post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
