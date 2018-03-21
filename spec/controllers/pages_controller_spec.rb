# frozen_string_literal: true

require 'rails_helper'

describe PagesController, type: :controller do
  context 'GET #about' do
    it 'renders the about template' do
      get :about
      expect(response).to have_http_status(:success)
      expect(response).to render_template('about')
    end
  end
  context 'GET #contact' do
    it 'renders the contact template' do
      get :contact
      expect(response).to have_http_status(:success)
      expect(response).to render_template('contact')
    end
  end
  context 'GET #frontpage' do
    it 'renders the about frontpage' do
      get :frontpage
      expect(response).to have_http_status(:success)
      expect(response).to render_template('frontpage')
    end
  end
  context 'GET #not_found' do
    it 'renders the not_found template' do
      get :not_found
      expect(response).to have_http_status(:not_found)
      expect(response).to render_template('not_found')
    end
  end
end
