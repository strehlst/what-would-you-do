# frozen_string_literal: true

require 'rails_helper'

describe Dream, type: :model do
  context 'caption present' do
    let(:dream) { Dream.create!(caption: 'pay back my student loan') }

    it 'returns a caption' do
      expect(dream.caption).to eq 'pay back my student loan'
    end
  end

  context 'caption missing' do
    let(:dream) { Dream.create(caption: nil) }

    it 'is not valid without a caption' do
      expect(dream).to_not be_valid
    end
  end
end
