# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  let(:user) do
    User.create!(public_name: 'User name',
                 email: 'user@example.com',
                 password: '12345?&@')
  end

  it 'returns a public name' do
    expect(user.public_name).to eq 'User name'
  end

  it 'returns an email' do
    expect(user.email).to eq 'user@example.com'
  end

  context 'invalid user' do
    let(:user) do
      User.new(email: 'user@example.com',
               password: '12345?&@')
    end
    it 'is not valid without a public name' do
      expect(user).not_to be_valid
    end

    let(:user) do
      User.new(public_name: 'User name',
               password: '12345?&@')
    end
    it 'is not valid without an e-mail address' do
      expect(user).not_to be_valid
    end

    let(:user) do
      User.new(public_name: 'User name',
               email: 'user@example',
               password: '12345?&@')
    end
    it 'is not valid with an invalid e-mail address' do
      expect(user).not_to be_valid
    end

    let(:user) do
      User.new(public_name: 'User name',
               email: 'user@example.com')
    end
    it 'is not valid without a password' do
      expect(user).not_to be_valid
    end

    let(:user) do
      User.new(public_name: 'User name',
               email: 'user@example.com',
               password: '12345?&')
    end
    it 'is not valid with a password bearing less than 8 characters' do
      expect(user).not_to be_valid
    end
  end
end
