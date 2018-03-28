# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'does not route to #index' do
      expect(get: '/users').not_to route_to('users#index')
    end

    it 'does not route to #new' do
      expect(get: '/users/new').not_to route_to('users#new')
    end

    it 'routes to #show' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/1/edit').not_to route_to('users#edit', id: '1')
    end

    it 'does not route to #create' do
      expect(post: '/users').not_to route_to('users#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1').not_to route_to('users#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1').not_to route_to('users#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1').not_to route_to('users#destroy', id: '1')
    end

    it 'routes to #dreams' do
      expect(get: '/user/dreams').to route_to('users#dreams')
    end
  end
end
