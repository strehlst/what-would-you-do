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

  it 'returns the associated dream' do
    expect(embrace.dream.id).to eq dream.id
  end

  it 'returns the associated user' do
    expect(embrace.user.id).to eq user.id
  end

  context 'scope' do
    let!(:first_user) do
      User.create!(public_name: 'Steven',
                   email: 'steven@wwyd.basicincome',
                   password: '12345?&@')
    end

    let!(:second_user) do
      User.create!(public_name: 'Ana',
                   email: 'ana@wwyd.basicincome',
                   password: '12345?&@')
    end

    let!(:third_user) do
      User.create!(public_name: 'João',
                   email: 'joao@wwyd.basicincome',
                   password: '12345?&@')
    end

    let!(:first_dream) { Dream.create!(caption: 'pay back my student loan') }
    let!(:second_dream) { Dream.create!(caption: 'live in Brazil for one year') }
    let!(:third_dream) { Dream.create!(caption: 'have more time for my mother') }

    let!(:first_embrace) { Embrace.create!(user: first_user, dream: second_dream) }
    let!(:second_embrace) do
      Embrace.create!(user: second_user,
                      dream: second_dream,
                      testimonial: 'My story of dealing with this...')
    end
    let!(:third_embrace) { Embrace.create!(user: third_user, dream: second_dream) }
    let!(:fourth_embrace) do
      Embrace.create!(user: third_user,
                      dream: first_dream,
                      testimonial: 'Another story of dealing with soemthing else...')
    end
    let!(:fifth_embrace) { Embrace.create!(user: second_user, dream: first_dream) }
    let!(:sixth_embrace) { Embrace.create!(user: second_user, dream: third_dream) }

    it 'only returns embraces with testimonials' do
      expect(Embrace.with_testimonial.count).to eql 2
      expect(Embrace.with_testimonial.first.testimonial).not_to be_nil
      expect(Embrace.with_testimonial[1].testimonial).not_to be_nil
      expect(Embrace.with_testimonial[2]).to be_nil
    end

    it 'returns embraces ordered by descending created_at date' do
      expect(Embrace.created_at_desc.first.id).to eq sixth_embrace.id
    end
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
