# frozen_string_literal: true

class Dream < ApplicationRecord
  has_many :dreams
  validates :caption, presence: true
end
