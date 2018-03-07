# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DreamsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  # TODO: Implement using gem 'factory_bot_rails'
  describe 'GET #show' do
    xit 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    xit 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    xit 'renders the new view' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  # TODO: Implement using gem 'factory_bot_rails'
  describe 'POST #create' do
    xit 'returns http success' do
      post :create
      expect(response).to have_http_status(:success)
    end
  end
end
