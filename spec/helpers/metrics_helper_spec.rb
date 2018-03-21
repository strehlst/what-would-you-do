# frozen_string_literal: true

require 'rails_helper'

describe MetricsHelper, type: :helper do
  describe 'load_metrics' do
    context 'no dreams and users have been created' do
      it 'should return metrics instance variables with value 0' do
        load_metrics
        expect(@dreams_count).to eq 0
        expect(@users_count).to eq 0
      end
    end
    context 'dreams and users have been created' do
      let!(:dream) { Dream.create!(caption: I18n.t('dreams.examples.travel_the_world')) }
      let!(:user) do
        User.create!(public_name: 'User name',
                     email: 'user@example.com',
                     password: '12345?&@')
      end
      it 'should return metrics instance variables with value 0' do
        load_metrics
        expect(@dreams_count).to eq 1
        expect(@users_count).to eq 1
      end
    end
  end
end
