# frozen_string_literal: true

require 'rails_helper'

describe UploadHelper, type: :helper do
  describe '#create_public_image_id' do
    let!(:user) do
      User.create!(public_name: 'User name',
                   email: 'user@example.com',
                   password: '12345?&@')
    end
    it 'returns an 9 + length of user_id long string format' do
      expect(create_public_image_id(user.id).split('_')[0]).to eq user.id.to_s
      expect(create_public_image_id(user.id).split('_')[0].size).to eq user.id.to_s.size
      expect(create_public_image_id(user.id).split('_')[1].size).to eq 8
    end
  end
  describe '#valid_image' do
    xit 'detects the presence of a valid jpg file' do
      _file = File.join(Rails.root, 'spec/fixtures/files/valid_jpg_file_square_1300px.jpg')
      _file = File.new(Rails.root.join('files/valid_jpg_file_square_1300px.jpg'))
      expect(valid_image(file)).to eql true
    end
  end
end
