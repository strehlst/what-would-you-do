# frozen_string_literal: true

require 'rails_helper'

describe Embrace, type: :model do
  let(:user) do
    User.create!(public_name: 'Steven',
                 email: 'steven@wwyd.basicincome',
                 password: '12345?&@')
  end
  let(:dream) { Dream.create!(caption: 'pay back my student loan') }
  let(:embrace) { Embrace.create!(user: user, dream: dream) }
end
