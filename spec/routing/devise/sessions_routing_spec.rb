# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devise::SessionsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/users/sign_in').to route_to('devise/sessions#new')
    end

    it 'routes to #create via POST' do
      expect(post: '/users/sign_in').to route_to('devise/sessions#create')
    end

    it 'routes to #destroy via DELETE' do
      expect(delete: '/users/sign_out').to route_to('devise/sessions#destroy')
    end
  end
end
