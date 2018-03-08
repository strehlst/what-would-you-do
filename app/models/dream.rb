# frozen_string_literal: true

class Dream < ApplicationRecord
  has_many :embraces
  validates :caption, presence: true

  def embraced?(user)
    Embrace.find_by(dream: self, user: user)
  end
end
