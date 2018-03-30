# frozen_string_literal: true

class Dream < ApplicationRecord
  include ValidationsHelper

  has_many :embraces

  validates :caption, presence: true
  validate :valid_caption_length

  def self.by_popularity_desc(limit = 20)
    Embrace.group('dream_id')
      .order('count_embraces_id desc')
      .count('embraces.id')
      .keys.shift(limit).map { |e| Dream.find(e) }
  end

  def embraced?(user)
    Embrace.find_by(dream: self, user: user).present? ? true : false
  end

  private

  def valid_caption_length
    caption = trim(caption)
    valid_length('caption', caption, 3, 255)
  end
end
