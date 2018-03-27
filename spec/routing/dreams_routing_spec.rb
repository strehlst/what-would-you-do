# frozen_string_literal: true

require 'rails_helper'

describe DreamsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/dreams').to route_to('dreams#index')
    end

    it 'routes to #new' do
      expect(get: '/dreams/new').to route_to('dreams#new')
    end

    it 'routes to #show' do
      expect(get: '/dreams/1').to route_to('dreams#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/dreams/1/edit').not_to route_to('dreams#edit', id: 1)
    end

    it 'route to #create' do
      expect(post: '/dreams').to route_to('dreams#create')
    end

    it 'does not route to #update via PUT' do
      expect(put: '/dreams/1').not_to be_routable
    end

    it 'does not route to #update via PATCH' do
      expect(patch: '/dreams/1').not_to be_routable
    end

    it 'does not route to #destroy' do
      expect(delete: '/dreams/1').not_to be_routable
    end
  end
end
