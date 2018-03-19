# frozen_string_literal: true

class Dream < ApplicationRecord
  has_many :embraces
  validates :caption, presence: true

  def self.by_popularity_desc(limit = 20)
    Embrace.group('dream_id')
      .order('count_embraces_id desc')
      .count('embraces.id')
      .keys.shift(limit).map { |e| Dream.find(e) }
  end

  def embraced?(user)
    Embrace.find_by(dream: self, user: user).present? ? true : false
  end
end
