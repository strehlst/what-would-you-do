# frozen_string_literal: true

class Dream < ApplicationRecord
  validates :caption, presence: true
end
