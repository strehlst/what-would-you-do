# frozen_string_literal: true

class Dream < ApplicationRecord
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
    trimmed_caption = caption.sub(/\s+\Z/, '')
    if trimmed_caption.length < 3
      errors[:caption] << I18n.t('dreams.errors.caption_too_short')
    elsif trimmed_caption.length > 255
      errors[:caption] << I18n.t('dreams.errors.caption_too_long')
    end
  end
end
