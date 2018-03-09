# frozen_string_literal: true

class Dream < ApplicationRecord
  has_many :embraces
  validates :caption, presence: true

  def self.by_popularity_desc
    Embrace.group('dream_id')
      .order('count_embraces_id desc')
      .count('embraces.id')
      .map { |e| Dream.find(e[0]) }
  end

  def embraced?(user)
    Embrace.find_by(dream: self, user: user)
  end

  def embrace_count
    Embrace.all.where(dream: self).count
  end
end
