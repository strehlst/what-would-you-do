# frozen_string_literal: true

require 'rails_helper'

describe PagesController, type: :routing do
  describe 'routing' do
    it 'routes to #about' do
      expect(get: '/about').to route_to('pages#about')
    end

    it 'routes to #articles' do
      expect(get: '/articles').to route_to('pages#articles')
    end

    it 'routes to #calendar' do
      expect(get: '/calendar').to route_to('pages#calendar')
    end

    it 'routes to #contact' do
      expect(get: '/contact').to route_to('pages#contact')
    end

    it 'routes to #frontpage' do
      expect(get: '/').to route_to('pages#frontpage')
    end

    it 'does not rout to #frontpage' do
      expect(get: '/frontpage').not_to route_to('pages#frontpage')
    end

    it 'routes to #not_found' do
      expect(get: '/page-not-found').to route_to('pages#not_found')
    end
  end
end
