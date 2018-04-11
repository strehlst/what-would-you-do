# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#frontpage'

  devise_for :users, controllers: { registrations: 'registrations' }
  get 'user/dreams', to: 'users#dreams'
  resources :users, path: I18n.t('routes.users'), only: %i[show edit update] do
    resources :embraces, path: I18n.t('routes.i_would'), only: %i[show new]
    resources :responses, only: %i[show new]
  end

  resources :dreams, path: I18n.t('routes.i_would'), only: %i[index show new create] do
    resources :embraces, only: %i[]
  end

  resources :surveys, only: %i[index show] do
    resources :responses, only: %i[index]
  end

  get I18n.t('routes.i_would') + '/:id/embrace', to: 'dreams#embrace', as: 'embrace_dream'
  delete I18n.t('routes.i_would') + '/:id/disembrace', to: 'dreams#disembrace', as: 'disembrace_dream'
  get I18n.t('routes.about'), to: 'pages#about', as: 'pages_about'
  get I18n.t('routes.calendar'), to: 'pages#calendar', as: 'pages_calendar'
  get I18n.t('routes.contact'), to: 'pages#contact', as: 'pages_contact'
  get I18n.t('routes.articles'), to: 'pages#articles', as: 'pages_articles'

  get I18n.t('routes.page_not_found'), to: 'pages#not_found', as: 'pages_not_found'

  match '*path', to: 'pages#not_found', via: %i[get post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
