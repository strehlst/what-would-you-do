# frozen_string_literal: true

class Dream < ApplicationRecord
  has_many :embraces
  validates :caption, presence: true
end
