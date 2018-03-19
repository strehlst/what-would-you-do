# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  let(:user) do
    User.create!(public_name: 'Steven',
                 email: 'steven@wwyd.basicincome',
                 password: '12345?&@')
  end

  it 'returns a public name' do
    expect(user.public_name).to eq 'Steven'
  end

  it 'returns an email' do
    expect(user.public_name).to eq 'Steven'
  end
end
