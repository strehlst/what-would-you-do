# frozen_string_literal: true

class Survey < ApplicationRecord
  has_many :responses

  def ongoing?
    true
  end
end
