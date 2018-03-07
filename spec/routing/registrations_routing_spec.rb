# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RegistrationsController, type: :routing do
  describe 'routing' do
    it 'routes to #cancel' do
      expect(get: '/users/cancel').to route_to('registrations#cancel')
    end

    it 'routes to #new' do
      expect(get: '/users/sign_up').to route_to('registrations#new')
    end

    it 'routes to #edit' do
      expect(get: '/users/edit').to route_to('registrations#edit')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users').to route_to('registrations#update')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users').to route_to('registrations#update')
    end

    it 'routes to #destroy via DELETE' do
      expect(delete: '/users').to route_to('registrations#destroy')
    end

    it 'routes to #create via POST' do
      expect(post: '/users').to route_to('registrations#create')
    end
  end
end
