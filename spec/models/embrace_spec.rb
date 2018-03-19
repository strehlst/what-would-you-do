# frozen_string_literal: true

require 'rails_helper'

describe Embrace, type: :model do
  let(:user) do
    User.create!(public_name: 'Steven',
                 email: 'steven@wwyd.basicincome',
                 password: '12345?&@')
  end
  let(:dream) { Dream.create!(caption: 'pay back my student loan') }

  let(:embrace) { Embrace.create!(user: user, dream: dream, testimonial: 'My story of dealing with this...') }
  it 'returns a testimonial' do
    expect(embrace.testimonial).to eql 'My story of dealing with this...'
  end

  context 'valid' do
    let(:user) do
      User.create!(public_name: 'Steven',
                   email: 'steven@wwyd.basicincome',
                   password: '12345?&@')
    end
    let(:dream) { Dream.create!(caption: 'pay back my student loan') }

    it 'is valid without a testimonial' do
      expect(Embrace.new(user: user, dream: dream)).to be_valid
    end

    it 'is invalid without a user' do
      expect(Embrace.new(dream: dream)).not_to be_valid
    end

    it 'is invalid without a dream' do
      expect(Embrace.new(user: user)).not_to be_valid
    end
  end
end
