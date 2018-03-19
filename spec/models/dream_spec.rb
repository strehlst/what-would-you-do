# frozen_string_literal: true

require 'rails_helper'

describe Dream, type: :model do
  context 'when caption present' do
    let(:dream) { Dream.create!(caption: 'pay back my student loan') }

    it 'returns a caption' do
      expect(dream.caption).to eq 'pay back my student loan'
    end

    context 'when caption too short' do
      let(:dream) { Dream.create(caption: 'no') }
      xit 'is not valid with a caption less than three characters long' do
        expect(:dream).not_to be_valid
      end
    end
  end

  context 'when caption missing' do
    let(:dream) { Dream.create(caption: nil) }

    it 'is not valid without a caption' do
      expect(dream).to_not be_valid
    end

    let(:dream) { Dream.create(caption: '') }

    it 'is not valid without a caption' do
      expect(dream).to_not be_valid
    end
  end

  context 'embrace' do
    let!(:user) do
      User.create!(public_name: 'Steven',
                   email: 'steven@wwyd.basicincome',
                   password: '12345?&@')
    end

    let!(:dream) { Dream.create!(caption: 'pay back my student loan') }
    let!(:unembraced_dream) { Dream.create!(caption: 'pay back my student loan') }
    let!(:embrace) { Embrace.create!(user: user, dream: dream) }
    it 'is embraced by a given user' do
      expect(dream.embraced?(user)).to eql true
    end

    it 'it is not embraced by a given user' do
      expect(unembraced_dream.embraced?(user)).to eql false
    end
  end

  context 'popularity' do
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
    let!(:second_embrace) { Embrace.create!(user: second_user, dream: second_dream) }
    let!(:third_embrace) { Embrace.create!(user: third_user, dream: second_dream) }
    let!(:fourth_embrace) { Embrace.create!(user: third_user, dream: first_dream) }
    let!(:fifth_embrace) { Embrace.create!(user: second_user, dream: first_dream) }
    let!(:sixth_embrace) { Embrace.create!(user: second_user, dream: third_dream) }

    it 'returns a complete list of dreams' do
      expect(Dream.by_popularity_desc.count).to eq 3
    end

    it 'returns a list of dreams ordered by descending popularity' do
      expect(Dream.by_popularity_desc.first).to eql second_dream
      expect(Dream.by_popularity_desc[1]).to eql first_dream
      expect(Dream.by_popularity_desc[2]).to eql third_dream
    end
  end
end
